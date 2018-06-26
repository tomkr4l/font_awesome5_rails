//= require all

document.addEventListener("turbolinks:before-render", function(event) {
    FontAwesome.dom.i2svg({
        node: event.data.newBody
    });
});