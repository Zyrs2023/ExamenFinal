document.addEventListener('DOMContentLoaded', function () {
    const center = document.querySelector('.center');
    const circle = document.querySelector('.circle');
    let isOpen = false;

    center.addEventListener('click', function () {
        isOpen = !isOpen;
        circle.classList.toggle('open');
        const items = circle.querySelectorAll('.menuItem');
        const angleStep = 360 / items.length;

        items.forEach((item, index) => {
            const angle = angleStep * index;
            const radians = (angle * Math.PI) / 180;
            const radius = 100; // Adjust if necessary
            const x = radius * Math.cos(radians);
            const y = radius * Math.sin(radians);
            item.style.transform = isOpen ? `translate(-50%, -50%) translate(${x}px, ${y}px)` : `translate(-50%, -50%)`;
        });
    });
});
