document.addEventListener("DOMContentLoaded", function () {
    const today = new Date();
    const currentYear = today.getFullYear();
    const currentDate = today.toISOString().split('T')[0];

    const bookingDateInput = document.getElementById("bookingDate");

    if (bookingDateInput) {
        bookingDateInput.setAttribute("min", currentDate);
        bookingDateInput.setAttribute("max", `${currentYear}-12-31`);
    }
});
