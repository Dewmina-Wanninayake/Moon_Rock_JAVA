window.onload = function() {
    const today = new Date();
    const currentYear = today.getFullYear();
    const currentDate = today.toISOString().split('T')[0]; 

   
    const arrivalInput = document.querySelector("input[name='arrival']");
    const departureInput = document.querySelector("input[name='departure']");

    
    arrivalInput.setAttribute("min", currentDate);
    arrivalInput.setAttribute("max", `${currentYear}-12-31`);

    departureInput.setAttribute("min", currentDate);
    departureInput.setAttribute("max", `${currentYear}-12-31`);
};

