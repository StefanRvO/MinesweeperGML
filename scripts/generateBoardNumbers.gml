//Convert to array, and also save array size
arrayX=ds_grid_width(0);
arrayY=ds_grid_height(0);

for (i=0;i<arrayX;i+=1)
{
    for(j=0;j<arrayY;j+=1)
    {
        bombPlacement[i,j]=ds_grid_get(0,i,j);
    }
}

ds_grid_destroy(0);

for (i=0;i<arrayX;i+=1)
{
    for(j=0;j<arrayY;j+=1)
    {
        
        //if bomb, skip to next check
        if(bombPlacement[i,j]==29)
        {
            continue;
        }
        //if bottom row, don't check bellow
        if (j==0)
        {
            //if left corner, only check 3 values
            if (i==0)
            {
                //check above
                if( bombPlacement[i,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //Check right
                if( bombPlacement[i+1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above right
                if( bombPlacement[i+1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
                //done checking left low corner
            //if right corner, only check 3 values
            if(i==arrayX-1)
            {
                //check above
                if( bombPlacement[i,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //Check left
                if( bombPlacement[i-1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above left
                if( bombPlacement[i-1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
                //done checking right low corner
            //check rest of low row
            else
            {
                //check left
                if(i!=0)
                {
                    if( bombPlacement[i-1,j]==29)
                    {  
                        bombPlacement[i,j]+=1;
                    }
                }
                //check right
                if( bombPlacement[i+1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above
                if( bombPlacement[i,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above left
                if(i!=0)
                {
                    if( bombPlacement[i-1,j+1]==29)
                    {  
                        bombPlacement[i,j]+=1;
                    }
                    }
                //check above right
                if( bombPlacement[i+1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
            //Done checking lowest row
        }

        //Check top row
        else if(j==arrayY-1) 
        {
        //if right corner, only check 3 values
            if(i==arrayX-1)
            {
                //check below
                if( bombPlacement[i,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //Check left
                if( bombPlacement[i-1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below left
                if( bombPlacement[i-1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
            //done checking right top corner
            //if left corner, only check 3 values
            else if (i==0)
            {
                //check below
                if( bombPlacement[i,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //Check right
                if( bombPlacement[i+1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below right
                if( bombPlacement[i+1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }

                //done checking right top corner
            //Check rest of top row
            else
            {
                //check left
                if( bombPlacement[i-1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check right
                if( bombPlacement[i+1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below
                if( bombPlacement[i,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below left
                if( bombPlacement[i-1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below right
                if( bombPlacement[i+1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
        }
            //Done checking top row
        
        //Check the other rows
        else
        {
            //if left, only check 5
            if (i==0)
            {
                //check right
                if( bombPlacement[i+1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                
                //check below
                if( bombPlacement[i,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above
                if( bombPlacement[i,j+1]==29)

                {  
                    bombPlacement[i,j]+=1;
                }
                //check below right
                if( bombPlacement[i+1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above right
                if( bombPlacement[i+1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
            //If right, only check 5
            else if (i==arrayX-1)
            {
                //check left
                if( bombPlacement[i-1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                
                //check below
                if( bombPlacement[i,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above
                if( bombPlacement[i,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below left
                if( bombPlacement[i-1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above left
                if( bombPlacement[i-1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
            //check rest
            else
            {
                //check left
                if( bombPlacement[i-1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check right
                if( bombPlacement[i+1,j]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                
                //check below
                if( bombPlacement[i,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above
                if( bombPlacement[i,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below left
                if( bombPlacement[i-1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above left
                if( bombPlacement[i-1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check below right
                if( bombPlacement[i+1,j-1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
                //check above right
                if( bombPlacement[i+1,j+1]==29)
                {  
                    bombPlacement[i,j]+=1;
                }
            }
        }
    } 
}
//ugly hack to fix bug somewhere which gives top left corner the wrong value..
if(bombPlacement[0,0]>=22 && bombPlacement[0,0]<=26)
{
    bombPlacement[0,0]-=20;
    bombPlacement[0,0]/=2;
    bombPlacement[0,0]+=20;
}
//hopefully done modyfying
//convert to grid
ds_grid_create(arrayX,arrayY);
for(i=0;i<arrayX;i+=1)
{
    for(j=0;j<arrayY;j+=1)
    {   
        ds_grid_add(0,i,j,bombPlacement[i,j]);
    }
}
//return 0 for sucess
return 0;                
