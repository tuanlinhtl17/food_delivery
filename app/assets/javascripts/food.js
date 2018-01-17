function openModal() {
    $('#myModal').css('display', 'block');
}

function closeModal() {
    $('#myModal').css('display','none');
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = $('.mySlides');
    var dots = $('.demo');
    var captionText = $('#caption');
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    captionText.innerHTML = dots[slideIndex-1].alt;
}

$(function () {
    var pics = [];
    $("#picture-upload").on("change",function () {
        pics.push($("#picture-upload").val());
        $("#picture-upload").val(pics)
        console.log(pics)
    })
})
