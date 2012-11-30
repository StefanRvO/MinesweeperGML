//function takes arguments x-axis-size,y-axis-size,number of bombs
//return array with random filled bombs. fields with 20 are empty, fields with 29 are bombs.
//First argument is horisontal size of board
x=argument0;
//Second argument is vertical size of board
y=argument1;
//Third argument is number of bombs
bombs=argument2;
//Fourth argument is clicked x-coordinate
pointX=argument3;
//fifth argument is clicked y-coordinate;
pointY=argument4;

//Throw error if bombs can't fit on board
if(bombs>x*y-9)
{   
    return -1;
}

//Fill array with 20. Indicate empty hidden field
for(i=0;i<x;i+=1)
{
    for(j=0;j<y;j+=1)
    {   
        bombplacement[i,j]=20;
    }
}

//make varibles as temporary placeholders
bombplacement_x=2;
bombplacement_y=2;
//Place the correct number of bombs
for(i=0;i<bombs;i+=1)
{
    //bombplacement_x=irandom(x-1);
    //bombplacement_y=irandom(y-1);
    //Be sure to choose a field, which hasn't a bomb already
    while(bombplacement[bombplacement_x,bombplacement_y]==29 || ((bombplacement_x>=pointX-1 && bombplacement_x<=pointX+1) && (bombplacement_y>=pointY-1 && bombplacement_y<=pointY+1)))
    {   
        bombplacement_x=irandom(x-1);
        bombplacement_y=irandom(y-1);
    }
    //Place bomb on choosen field
    bombplacement[bombplacement_x,bombplacement_y]=29;
}
//Return array
ds_grid_create(x,y);
for(i=0;i<x;i+=1)
{
    for(j=0;j<y;j+=1)
    {   
        ds_grid_add(0,i,j,bombplacement[i,j]);
    }
}
return 0;

