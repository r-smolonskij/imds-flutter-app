//JS CODEconst MAX_WIDTH = 320;
const MAX_HEIGHT = 320;
const MIME_TYPE = "image/jpeg";
const QUALITY = 0.9;

const input = document.getElementById("img-input");
input.onchange = function (ev) {
  for(i = 0; i < ev.target.files.length; i++){
    const file = ev.target.files[i];
     const img = new Image();
     const blobURL = URL.createObjectURL(file);
   
  img.src = blobURL;
  img.onerror = function () {
    URL.revokeObjectURL(this.src);
    // Handle the failure properly
    console.log("Cannot load image");
  };
  img.onload = function () {
    URL.revokeObjectURL(this.src);
    const [newWidth, newHeight] = calculateSize(img, MAX_WIDTH, MAX_HEIGHT);
    const canvas = document.createElement("canvas");
    canvas.width = newWidth;
    canvas.height = newHeight;
    const ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0, newWidth, newHeight);
    canvas.toBlob(
      (blob) => {
        // Handle the compressed image. es. upload or save in local state
        displayInfo('Original file', file);
        displayInfo('Compressed file', blob);
      },
      MIME_TYPE,
      QUALITY
    );
    dataurl = canvas.toDataURL(file.type);
    saveAs(dataurl, file.name);
  };
  }  
};

function calculateSize(img, maxWidth, maxHeight) {
  let width = img.width;
  let height = img.height;

  // calculate the width and height, constraining the proportions
  if (width > height) {
    if (width > maxWidth) {
      height = Math.round((height * maxWidth) / width);
      width = maxWidth;
    }
  } else {
    if (height > maxHeight) {
      width = Math.round((width * maxHeight) / height);
      height = maxHeight;
    }
  }
  return [width, height];
}

// Utility functions for demo purpose

function displayInfo(label, file) {
  const p = document.createElement('p');
  p.innerText = `${label} - ${readableBytes(file.size)}`;
  document.getElementById('root').append(p);
}

function readableBytes(bytes) {
  const i = Math.floor(Math.log(bytes) / Math.log(1024)),
    sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

  return (bytes / Math.pow(1024, i)).toFixed(2) + ' ' + sizes[i];
}

//HTML CODE
<div id="root">
  <p>Upload an image and see the result</p>
  <input id="img-input" multiple type="file" accept="image/*" style="display:block" />
</div>