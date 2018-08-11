from defines import *

class USB_device(QtCore.QObject):
    dataReceived = QtCore.pyqtSignal(object)
    
    def __init__(self, idVendor, idProduct, parent=None):
        QtCore.QObject.__init__(self)
        self.primaryBuff = []
        self.secondBuff = []
        self.run = True
        self.mutex = QMutex()
        self.parent = parent
        self.idVendor = idVendor
        self.idProduct = idProduct
        self.connected = False
        
    def __del__(self):
        self.discconect_device()
        
    def connect_device(self):
        self.device = usb.core.find(idVendor = self.idVendor, idProduct = self.idProduct)
        if self.device == None:
            return False
        try:
            self.device.set_configuration()
            self.config = self.device.get_active_configuration()
            self.interface = self.config[(0,0)]
            #print("interface Got")
            self.epIn = usb.util.find_descriptor(
                self.interface,
                custom_match = \
                lambda ep: \
                    usb.util.endpoint_direction(ep.bEndpointAddress) == \
                    usb.util.ENDPOINT_IN)
            self.epOut = usb.util.find_descriptor(
                self.interface,
                custom_match = \
                lambda ep: \
                    usb.util.endpoint_direction(ep.bEndpointAddress) == \
                    usb.util.ENDPOINT_OUT)
            #print("inout defined")
        except:
            self.discconect_device()
            return False
        self.connected = True
        return True
        
    def read_loop(self):
        while(True):
            newData = []
            try:
                message = self.epIn.read(64)
                newData = [chr(data) for data in message]
            except:
                continue
            if self.mutex.tryLock():
                if(self.secondBuff != []):
                    self.primaryBuff = self.primaryBuff + self.secondBuff
                    self.secondBuff = []
                self.primaryBuff = self.primaryBuff + newData
                self.mutex.unlock()
                self.dataReceived.emit(self.primaryBuff)
            else:
                self.secondBuff = self.secondBuff + newData

    def send_data(self, data):              # Max Size 64 Bytes 
        self.epOut.write(data)
        
    def disconnect_device(self):
        usb.util.release_interface(self.device, self.interface)
        usb.util.dispose_resources(self.device)