//replacment of OpenAField to prevent stackoverflows. Probably very slow (well, not that slow) :(

pointX=argument0;
pointY=argument1;
//read grid to array
arrayX=ds_grid_width(0);
arrayY=ds_grid_height(0);
for (i=0;i<arrayX;i+=1)
{
    for(j=0;j<arrayY;j+=1)
    {
        bombarray[i,j]=ds_grid_get(0,i,j);
    }
}
ds_grid_destroy(0);
//open field
bombarray[pointX,pointY]-=20;

//open fields

runloop=1;
while(runloop)
{
    runloop=0;
    for(i=0;i<arrayX;i+=1)
    {
        for(j=0;j<arrayY;j+=1)
        {
            //if a field around is 0, open the field
            
            if(bombarray[i,j]!=29)
            {
                if(i<arrayX-1) {
                    if(bombarray[i+1,j]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                if (i<arrayX-1 && j<arrayY-1) {
                    if(bombarray[i+1,j+1]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                if(j<arrayY-1) 
                {
                    if(bombarray[i,j+1]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                if(i!=0 && j<arrayY-1)
                {
                    if(bombarray[i-1,j+1]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                if(i!=0)
                {
                    if(bombarray[i-1,j]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                
                if(i!=0 && j!=0)
                {
                    if(bombarray[i-1,j-1]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                
                if(j!=0)
                {
                    if(bombarray[i,j-1]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                if(j!=0 && i<arrayX-1)
                {
                    if(bombarray[i+1,j-1]==0 && bombarray[i,j]>=20)
                    {   
                        bombarray[i,j]-=20;
                        runloop=1;
                    }
                }
                
            }        
        }
    }
}
ds_grid_create(arrayX,arrayY);
for(i=0;i<arrayX;i+=1)
{
    for(j=0;j<arrayY;j+=1)
    {   
        ds_grid_add(0,i,j,bombarray[i,j]);
    }
}
return 0;
