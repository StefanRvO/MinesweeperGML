arrayX=ds_grid_width(0);
arrayY=ds_grid_height(0);
for (i=0;i<arrayX;i+=1)
{
    for(j=0;j<arrayY;j+=1)
    {
        bombarray[i,j]=ds_grid_get(0,i,j);
    }
}

//count number of flags placed and number of fields open
flags=0
fields=0;
for(i =0;i<arrayX;i+=1)
{
    for(j =0;j<arrayY;j+=1)
    {
        if (bombarray[i,j]>=0 && bombarray[i,j]<=8)
        {
            fields+=1;
        }
        else if (bombarray[i,j]>=10 && bombarray[i,j]<=19)
        {
            flags+=1;
        }
    }
}
global.fieldsOpen=fields;
global.flagsPlaced=flags;
