document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "purple";
  ctx.fillRect(0, 0, 500, 500);

  let x = 50;
  let y = 100;

  function circle(x,y) {
    ctx.fillStyle = "purple";
    ctx.fillRect(0,0, 500, 500);
    ctx.beginPath();
    ctx.arc(x, y, 20, 0, 2*Math.PI, true);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();
  }

  function recursive( dirx, diry, slope ) {
    window.setTimeout(function() {
      circle(x, y);
      console.log( slope )

      if (dirx === true && diry === true ) {
        x += 3 * slope;
        y += 3;
        if ( x >= 470 ) {
          dirx = false;
          slope = Math.abs(x / y);
        } else if ( y >= 470 ) {
          diry = false;
          slope = Math.abs(y / x);
        }
        recursive(dirx, diry, slope);
      } else if (dirx === true && diry === false ) {
        x += 3 * slope;
        y -= 3;
        if ( x >= 470 ) {
          dirx = false;
          slope = Math.abs(x / y);
        } else if ( y <= 30 ) {
          diry = true;
          slope = Math.abs(y / x);
        }
        recursive(dirx, diry, slope);
      } else if (dirx === false && diry === true) {
        x -= 3 * slope;
        y += 3;
        if ( x <= 30 ) {
          dirx = true;
          slope = Math.abs(x / y);
        } else if ( y >= 470 ) {
          diry = false;
          slope = Math.abs(y / x);
        }
        recursive(dirx, diry, slope);
      } else if (dirx === false && diry === false) {
        x -= 3 * slope;
        y -= 3;
        if ( x <= 30 ) {
          dirx = true;
          slope = Math.abs(x / y);
        } else if ( y <= 30 ) {
          diry = true;
          slope = Math.abs(y / x);
        }
        recursive(dirx, diry, slope);
      }

    }, 50);
  }

  // function getDir() {
  //   if ( x > y ) {
  //     return "x";
  //   } else {
  //     return "y";
  //   }
  // }

  recursive(true, true, 2);
});
