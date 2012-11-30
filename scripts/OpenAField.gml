//Opens the blocks around a field with value 20.
//replaced by OpenFields. Gamemaker can't handle recursions probaly

var pointX;
var pointY;
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

//check around the field //not working, won't check correcty to rght and down

if(pointX!=0) {
    if(bombarray[pointX-1,pointY]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX-1,pointY);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX-1,pointY]>20 && bombarray[pointX-1,pointY]<29)
    {
        bombarray[pointX-1,pointY]-=20;
    }
}
if(pointX!=0 && pointY!=0) 
{
    if(bombarray[pointX-1,pointY-1]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX-1,pointY-1);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX-1,pointY-1]>20 && bombarray[pointX-1,pointY-1]<29)
    {
        bombarray[pointX-1,pointY-1]-=20;
    }
}
    
    
if(pointY!=0) 
{
    if(bombarray[pointX,pointY-1]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX,pointY-1);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX,pointY-1]>20 && bombarray[pointX,pointY-1]<29)
    {
        bombarray[pointX,pointY-1]-=20;
    }
}
if (pointY!=0 && pointX<arrayX-1) 
{
    if(bombarray[pointX+1,pointY-1]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX+1,pointY-1);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX+1,pointY-1]>20 && bombarray[pointX+1,pointY-1]<29)
    {
        bombarray[pointX+1,pointY-1]-=20;
    }
}
if(pointX<arrayX-1) 
{
    if(bombarray[pointX+1,pointY]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX+1,pointY);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX+1,pointY]>20 && bombarray[pointX+1,pointY]<29)
    {
        bombarray[pointX+1,pointY]-=20;
    }
}
if (pointX<arrayX-1 && pointY<arrayY-1) 
{
    if(bombarray[pointX+1,pointY+1]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenFields(pointX+1,pointY+1);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX+1,pointY+1]>20 && bombarray[pointX+1,pointY+1]<29)
    {
        bombarray[pointX+1,pointY+1]-=20;
    }
}
    
if(pointY<arrayY-1) 
{
    if(bombarray[pointX,pointY+1]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX,pointY+1);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX,pointY+1]>20 && bombarray[pointX,pointY+1]<29)
    {
        bombarray[pointX,pointY+1]-=20;
    }
}
    
if (pointX!=0 && pointY<arrayY-1) 
{
    if(bombarray[pointX-1,pointY+1]==20)
    {
        ds_grid_create(arrayX,arrayY);
        for(i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {   
                ds_grid_add(0,i,j,bombarray[i,j]);
            }
        }
        OpenAField(pointX-1,pointY+1);
        for (i=0;i<arrayX;i+=1)
        {
            for(j=0;j<arrayY;j+=1)
            {
                bombarray[i,j]=ds_grid_get(0,i,j);
            }
        }
        ds_grid_destroy(0);
    }
    else if(bombarray[pointX-1,pointY+1]>20 && bombarray[pointX-1,pointY+1]<29)
    {
        bombarray[pointX-1,pointY+1]-=20;
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
         
