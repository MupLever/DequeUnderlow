window.PaintHref = function(event, backgroundColorOne, backgroundColorTwo) 
{
    event.preventDefault();
    if(event.type == 'mousedown')
    {
        event.target.style.color = backgroundColorOne;
    }
    if(event.type == 'mouseup')
    {
        event.target.style.color = backgroundColorTwo;
    }

}