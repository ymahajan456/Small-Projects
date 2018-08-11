
GCD8

	when rest =>          --wait till start signal
		init count = 8;
		if(start = '1') then next_state = update; --to set values in register
	
	when update =>       
		set GCD2 outAccepted;   --so that gcd2 can go to rst state
		if (counter = '0') then next_state = done; Enable outReg;
		else count = count - 1; next_state = getInput;
	
	when getInput =>  --get inputs from external enviornment
		set srdy;
		if(erdy = '1') then
			next_state = applyInputs;
			if(count = 7) then apply input to both areg & breg; --setting initial GCD = first input
			else apply input only to areg;
	
	when applyInputs =>   --apply inputs to GCD2
		if(GCD2 is redy) then 
			set input redy for GCD2;
			next_state = getGCD;
	
	when getGCD =>       --get GCD og two numbers from GCD2 
		if(GCD2 output = '1') then 
			store GCD in breg;
			next_state = update;
			
	when done =>
		set done flag;
		next_state = rest;
	
---------------------------------------------------------------

GCD2

	when rest =>
		set ready flag;  --GCD2 is ready to accept two numbers
		if(inputReady = '1') then 
			next_state = divide;
			store inputs in areg and breg;
		
	when divide =>      --apply inputs to divider
		if(dividerReady) then 
			set dividerInputReady;
			next_state = accOut;
			
	when accOut =>    --get remainder from divider
		if(dividerOutReady) then	
			next_state = update;
			
	when update =>
		store breg in areg;
		store remainder in breg;
		set GCD2outputAccepted;
		if(breg = 0) then next_state = done;
		else next_state = divide;
		
	when done =>
		set done flag;
		wait until(outAccepted = '1')  --wait till GCD8 accepts output
		next_state = rest;
		
---------------------------------------------------------------
		