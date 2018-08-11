s1 = DTS;
s1.time = [-3,-2,-1,0,0,2,3,4];     % just enter non-zero elements
s1.val = [0,1,2,-1,4,3,5,0];

s1.set = containers.Map(s1.time,s1.val);

s2 = DTS;
s2.time = [1,2,3,4,5,6,7];
s2.val = [0,1,-1,2,-2,3,0];
s2.set = containers.Map(s2.time,s2.val);
%readDTS(p,9)

a = min(s1.time);
b = max(s1.time);
c = min(s2.time);
d = max(s2.time);

iter = b+d-a-c+1;
time = zeros(1,iter);
val = time;

for i = 1:iter 
    n = i+a+c-1;
    time(i) = n;
    yn = 0;
    for j = a:n-c
        yn = yn + s1.readDTS(j)*s2.readDTS(n-j);
    end
    val(i) = yn;
end    

figure;
subplot(2,2,1)
stem(s1.time,s1.val);
title('Signal 1')
subplot(2,2,3)
stem(s2.time,s2.val);
title('Signal 2')
subplot(2,2,[2,4])
stem(time,val,'.r')
title('Output')


    
