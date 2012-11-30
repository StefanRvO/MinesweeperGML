
//recursion fucks with us unless we do this
var pointX;
var pointY;
var flag;
var recursionlevel;
//PointX and Y is selected coordinates
pointX=argument0;
pointY=argument1;

//are we in flag mode or not? (zero indicate normal, one indicate flag)
flag=argument2;
//prevent recursion 
recursionlevel=argument3;

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
if(flag) 
{
    //if already faged, remove flag.
    if(bombarray[pointX,pointY]<20 && bombarray[pointX,pointY]>=10)
    {
        bombarray[pointX,pointY]+=10;
    }
    else
    {   //else, place flag
        bombarray[pointX,pointY]-=10;
    }
}
else if(bombarray[pointX,pointY]==29)
{
    //if field is 29, you hit a bomb.. Return 29 (generate grid to prevent unknown index error) //also set field to 9 to show bomb(EXPLODED) set all other bombs to -9, to show unexploded bombs.
    //alse set wrong flags to -10.
    bombarray[pointX,pointY]=9;
    ds_grid_create(arrayX,arrayY);
    for(i=0;i<arrayX;i+=1)
    {
        for(j=0;j<arrayY;j+=1)
        {   
            ds_grid_add(0,i,j,bombarray[i,j]);
        }
    }
//    MakeEndBoard() //not implented yet
    
    return 29;
}
else if(bombarray[pointX,pointY]>20 && bombarray[pointX,pointY]< 29) 
{
    bombarray[pointX,pointY]-=20;
}
else if(bombarray[pointX,pointY]==20)
{
    //if field is zero, open fields around it (and open itself)
    ds_grid_create(arrayX,arrayY);
    for(i=0;i<arrayX;i+=1)
    {
        for(j=0;j<arrayY;j+=1)
        {   
            ds_grid_add(0,i,j,bombarray[i,j]);
        }
    }
    OpenFields(pointX,pointY);
    for (i=0;i<arrayX;i+=1)
    {
        for(j=0;j<arrayY;j+=1)
        {
            bombarray[i,j]=ds_grid_get(0,i,j);
        }
    }
    ds_grid_destroy(0);
    
}
    ds_grid_create(arrayX,arrayY);
    for(i=0;i<arrayX;i+=1)
    {
        for(j=0;j<arrayY;j+=1)
        {   
            ds_grid_add(0,i,j,bombarray[i,j]);
        }
    }
    
//if field is a number, we have to check aound it to see if flags are set, and the open fields (don't know if this couses to much recursion)

if(bombarray[pointX,pointY]>=1 && bombarray[pointX,pointY]<=7 && recursionlevel==0)
{
    var flagcount;
    flagcount=0;
    for(i=-1; i<=1;i+=1)
    {
        for(j=-1; j<=1;j+=1)
        {
            //check for flag
            if( not (pointX=0 && i=-1) && not(pointX==arrayX-1 && i=1) && not (pointY=0 && j=-1) && not (pointY=arrayY-1 && j=1))
            if(bombarray[pointX+i,pointY+j]>=10 && bombarray[pointX+i,pointY+j]<=19)
            {
                flagcount+=1;
            }
        }
    }
    //if not(flag) show_message(string(flagcount));
    //if flaged correct number, click fields around. (also prevent to open outsice of array)
    if (flagcount==bombarray[pointX,pointY])
    {
        if (pointX!=arrayX-1)
        if(bombarray[pointX+1,pointY]>=20 && bombarray[pointX+1,pointY]<=29)
        if(clickField(pointX+1,pointY,0,1)==29)
        return 29;
        
        if (pointX!=arrayX-1 && pointY!=arrayY-1)
        if(bombarray[pointX+1,pointY+1]>=20 && bombarray[pointX+1,pointY+1]<=29)
        if(clickField(pointX+1,pointY+1,0,1)==29)
        return 29;
        
        if(pointX!=arrayX-1 && pointY!=0)
        if(bombarray[pointX+1,pointY-1]>=20 && bombarray[pointX+1,pointY-1]<=29)
        if(clickField(pointX+1,pointY-1,0,1)==29)
        return 29;
        
        if (pointY!=arrayY-1)
        if(bombarray[pointX,pointY+1]>=20 && bombarray[pointX,pointY+1]<=29)
        if(clickField(pointX,pointY+1,0,1)==29)
        return 29;
        
        if (pointY!=0)
        if(bombarray[pointX,pointY-1]>=20 && bombarray[pointX,pointY-1]<=29)
        if(clickField(pointX,pointY-1,0,1)==29)
        return 29;
        
        if(pointX!=0)
        if(bombarray[pointX-1,pointY]>=20 && bombarray[pointX-1,pointY]<=29)
        if(clickField(pointX-1,pointY,0,1)==29)
        return 29;
        
        if(pointX!=0 && pointY!=arrayY-1)
        if(bombarray[pointX-1,pointY+1]>=20 && bombarray[pointX-1,pointY+1]<=29)
        if(clickField(pointX-1,pointY+1,0,1)==29)
        return 29;
        
        if (pointX!=0 && pointY!=0)
        if(bombarray[pointX-1,pointY-1]>=20 && bombarray[pointX-1,pointY-1]<=29)
        if (clickField(pointX-1,pointY-1,0,1)==29)
        return 29;
        }
        
    
        
}
return 0;
