`define WAYS 16	



reg[`WAYS-1:0] plrubit[`index-1:0];

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
 
    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][7]=!(plrubit[index][7]);
	
 end
 
 1:
 
   begin 
	
    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][7]=!(plrubit[index][7]);
	
	end
	
	
2: 

   begin

    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][8]=!(plrubit[index][8]);	
	
	end
	
3: 

begin 

    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][8]=!(plrubit[index][8]);
		
		end
		
4: 
 begin

	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][9]=!(plrubit[index][9]);
end

5: 

begin

    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][9]=!(plrubit[index][9]);

end

6:

begin


    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][10]=!(plrubit[index][10]);

end

7:

begin

	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
  	plrubit[index][10]=!(plrubit[index][10]);

end

8:

begin

	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][5]=!(plrubit[index][5]);
	plrubit[index][11]=!(plrubit[index][11]);
	

end

9:

begin

	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][5]=!(plrubit[index][5]);
	plrubit[index][11]=!(plrubit[index][11]);

end

10:

begin

    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][5]=!(plrubit[index][5]);
	plrubit[index][12]=!(plrubit[index][12]);
	

end

11:

begin


	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][5]=!(plrubit[index][5]);
	plrubit[index][12]=!(plrubit[index][12]);

end

12:

begin 

    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][6]=!(plrubit[index][6]);
	plrubit[index][13]=!(plrubit[index][13]);	
 
 end
 
 13:
 
 begin
 
    plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][6]=!(plrubit[index][6]);
	plrubit[index][13]=!(plrubit[index][13]);
	
	
	end
	
	
	14:
	
	begin
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][6]=!(plrubit[index][6]);
	plrubit[index][14]=!(plrubit[index][14]);
	
	end
	
	
	
	
	15:
	
	
	begin
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][6]=!(plrubit[index][6]);
	plrubit[index][14]=!(plrubit[index][14]);
	
	
	end
	
	
	end task;
 
 end
 
 task missupdatelru();
 
 begin
 
 if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b0) && ((plrubit[index][3])==1'b0) && ((plrubit[index][7])==1'b0)) 
 
 begin

{
	cache[index].way =0;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][7]=!(plrubit[index][7]);	
	
}
 
end 
 
 if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b0) && ((plrubit[index][3])==1'b0) && ((plrubit[index][7])==1'b1)) 
 
 begin

{
	cache[index].way =1;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][7]=!(plrubit[index][7]);
}
 
end 
 
  if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b0) && ((plrubit[index][3])==1'b0) && ((plrubit[index][8])==1'b0)) 
 
 begin

{
	cache[index].way =2;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][8]=!(plrubit[index][8]);
	
}
 
end 
 
  if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b0) && ((plrubit[index][3])==1'b0) && ((plrubit[index][8])==1'b1)) 
 
 begin

{
	cache[index].way =3;
	
	   plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(plrubit[index][3]);
	plrubit[index][8]=!(plrubit[index][8]);	
	
}
 
end 
 
  if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b1) && ((plrubit[index][4])==1'b0) && ((plrubit[index][9])==1'b0)) 
 
 begin

{
	cache[index].way =4;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][9]=!(plrubit[index][9]);
	
}
 
end 
 
  if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b1 && ((plrubit[index][4])==1'b0) && ((plrubit[index][9])==1'b1)) 
 
 begin

{
	cache[index].way =5;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][9]=!(plrubit[index][9]);
	
}
 
end 
 
  if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b1) && ((plrubit[index][4])==1'b1) && ((plrubit[index][10])==1'b0)) 
 
 begin

{
	cache[index].way =6;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][10]=!(plrubit[index][10]);
	
}
 
end 
 
  if (((plrubit[index][0])==1'b0) && ((plrubit[index][1])==1'b1) && ((plrubit[index][4])==1'b1) && ((plrubit[index][10])==1'b1)) 
 
 begin

{
	cache[index].way =7;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][4]=!(plrubit[index][4]);
	plrubit[index][10]=!(plrubit[index][10]);

}
 
end 
 
 if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b0) && ((plrubit[index][5])==1'b0) && ((plrubit[index][11])==1'b0)) 
 
 begin

{
	cache[index].way =8;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][2]=!(plrubit[index][2]);
	plrubit[index][5]=!(plrubit[index][5]);
	plrubit[index][11]=!(plrubit[index][11]);
	
}
 
end 
 
  if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b0) && ((plrubit[index][5])==1'b0) && ((plrubit[index][11])==1'b1)) 
 
 begin

{
	cache[index].way =9;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 
 
  if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b0) && ((plrubit[index][5])==1'b1) && ((plrubit[index][12])==1'b0)) 
 
 begin

{
	cache[index].way =10;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 


if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b0) && ((plrubit[index][5])==1'b1) && ((plrubit[index][12])==
1'b1)) 
 
 begin

{
	cache[index].way =11;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 
 
  if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b1) && ((plrubit[index][6])==1'b0) && ((plrubit[index][13])==1'b0)) 
 
 begin

{
	cache[index].way =12;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 
 
  if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b1) && ((plrubit[index][6])==1'b0) && ((plrubit[index][13])==1'b1)) 
 
 begin

{
	cache[index].way =13;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 
 
  if (((plrubit[index][0])==1'b1) && ((cache[index].b[2)==1'b1) && ((plrubit[index][6])==1'b1) && ((plrubit[index][14])==1'b0)) 
 
 begin

{
	cache[index].way =14;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 
 
  if (((plrubit[index][0])==1'b1) && ((plrubit[index][2])==1'b1 && ((plrubit[index][6])==1'b1) && ((plrubit[index][14])==1'b1)) 
 
 begin

{
	cache[index].way =15;
	
	plrubit[index][0]=!(plrubit[index][0]);
	plrubit[index][1]=!(plrubit[index][1]);
	plrubit[index][3]=!(invert(plrubit[index][3]);
	plrubit[index][7]=!(invert(plrubit[index][7]);	
	
}
 
end 

end
 
 
 
 
 
 
 
 
 
 