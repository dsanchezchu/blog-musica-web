// Pantalla de carga
const spinnerLoader = document.querySelector('.spinner-wrapper');

window.addEventListener('load', () => {
    spinnerLoader.style.opacity = '0';

    setTimeout(() => {
        spinnerLoader.style.display = 'none';
    }, 200);
});