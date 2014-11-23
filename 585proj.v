
`include "defines.v";

module l3cache();
begin

input [`TAG_BITS-1 : 0] tag;
input [`INDEX_BITS-1:0] index;
input [`LRU_BITS-1:0] LRU;	
input [`OPR_BITS-1:0];		
output [2:0] out_bus;		
output [1:0] out_snoop;			
reg [2:0] out_bus;	
reg [1:0] out_snoop;	

//cache structure 

reg[`WAYS-1:0] plrubit[`index-1:0];
reg[`WAYS-1:0] temp;








// Input Commands
parameter cpu_write		= 4'd1;
parameter cpu_read 		= 4'd0;
parameter cpu_read_l2	= 4'd2; // Really not sure if we should distinguish between code and instruction. help
parameter s_invalidate	= 4'd3;
parameter s_read		= 4'd4;
parameter s_write		= 4'd5;
parameter s_rfo			= 4'd6;
parameter clean			= 4'd8;
parameter print			= 4'd9;

/*
0 read	request	from	L1	data	cache
1 write	request	from	L1	data	cache
2 read	request	from	L1	instruction	cache
3 snooped	invalidate	command
4 snooped	read	request
5 snooped	write	request
6 snooped	read	with	intent	to	modify
8 clear	the	cache	and	reset	all	state
9 print	contents	and	state	of	each	valid	cache	line	(allow	subsequent	trace	activity) 
*/

//Bus Operation types
parameter READ 			= 3'd1; 		/* Bus Read */ 
parameter WRITE 		= 3'd2; 		/* Bus Write */ 
parameter INVALIDATE 	= 3'd3; 		/* Bus Invalidate */ 
parameter RFO 			= 3'd4; 		/* Bus Read With Intent to Modify */  
parameter NOP			= 3'd5;

// States 
parameter modified 	= 3'd0;
parameter exclusive = 3'd1;
parameter shared 	= 3'd2;
parameter invalid 	= 3'd3;
parameter forward 	= 3'd4;

// Snoop parameters
parameter hit 		= 2'd0;
parameter hitm		= 2'd1;
parameter nohit		= 2'd2;


always @(instruction or TraceAddress or PC)
begin
	case(instruction)
	
	0:
	begin
	readaddress();
	checktag();
	getsnoop();
	if(cachehit==1)
	begin
	increasehitcount();
	hitupdatelru();
	updatemesi();
	end
	else
	begin
	increasemisscount();
	missupdatelru();
	updatemesi();
	end
	end
	
	1:
	
	begin
	readaddress();
	checktag();
	getsnoop();
	if(cachehit==1)
	begin
	increasehitcount();
	hitupdatelru();
	updatemesi();
	end
	else 
	begin
	increasemisscount();
	updatemesi();
	end
	end
	
	2:
	
	begin
	readaddress();
	checktag();
	getsnoop();
	if(cachehit==1)
	begin
	increasehitcount();
	hitupdatelru();
	updatemesi();
	end
	else
	begin
	increasemisscount();
	missupdatelru();
	updatemesi();
	end
	
3:

begin

readaddress();
checktag();
if(cachehit==1)
begin

updatemesi();
end
end

4:
begin
readaddress();
checktag();
if(cachehit==1)
begin
updatemesi();
end
end

5:
begin
readaddress();
checktag();
if(cachehit==1)
begin
updatemesi();
end
end

6:
begin
readaddress();
checktag();
if(cachehit==1)
begin
updatemesi();
end
end

8:
begin
clearcache();
resetmesi();
cleartag();
clearlru();
end
9:
begin
printtag();
printmesif();
end
end



task increasehitcount;
begin
hitcount=hitcount+1;
end

task increasemisscount;
begin
misscount=misscount+1;
end

task checktag; 
begin 
cachehit = 0; 
for(i = 0 ; i < `WAYS ; i = i + 1)
 begin 
 if(tagcache[index][i] == tag)
 begin 
 if(validbit[index][i] == VALID)
 begin 
 cachehit = 1; 
 way = i;
 end 
 end
 end 
 end 
 

 
 task hitupdatelru();
 begin
 
 always @ (way)
 
 begin 
 
 case (way)
 
 0: 
 
 begin
 
 temp = plrubit[index];
 
    temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[3]=!(temp[3]);
	temp[7]=!(temp[7]);
	
plrubit[index]=temp;	
	
 end
 
 1:
 
   begin 
	
    temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[3]=!(temp[3]);
	temp[7]=!(temp[7]);
	
	end
	
	
2: 

   begin

    temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[3]=!(temp[3]);
	temp[8]=!(temp[8]);	
	
	end
	
3: 

begin 

    temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[3]=!(temp[3]);
	temp[8]=!(temp[8]);
		
		end
		
4: 
 begin

	temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[4]=!(temp[4]);
	temp[9]=!(temp[9]);
end

5: 

begin

    temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[4]=!(temp[4]);
	temp[9]=!(temp[9]);

end

6:

begin


    temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[4]=!(temp[4]);
	temp[10]=!(temp[10]);

end

7:

begin

	temp[0]=!(temp[0]);
	temp[1]=!(temp[1]);
	temp[4]=!(temp[4]);
  	temp[10]=!(temp[10]);

end

8:

begin

	temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[5]=!(temp[5]);
	temp[11]=!(temp[11]);
	

end

9:

begin

	
	temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[5]=!(temp[5]);
	temp[11]=!(temp[11]);

end

10:

begin

    temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[5]=!(temp[5]);
	temp[12]=!(temp[12]);
	

end

11:

begin


	temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[5]=!(temp[5]);
	temp[12]=!(temp[12]);

end

12:

begin 

    temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[6]=!(temp[6]);
	temp[13]=!(temp[13]);	
 
 end
 
 13:
 
 begin
 
    temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[6]=!(temp[6]);
	temp[13]=!(temp[13]);
	
	
	end
	
	
	14:
	
	begin
	
	temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[6]=!(temp[6]);
	temp[14]=!(temp[14]);
	
	end
	
	
	
	
	15:
	
	
	begin
	
	temp[0]=!(temp[0]);
	temp[2]=!(temp[2]);
	temp[6]=!(temp[6]);
	temp[14]=!(temp[14]);
	
	
	end
	
	
	end task;
 

endmodule





	