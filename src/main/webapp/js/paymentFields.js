function togglePaymentFields() {
    var selectedMethod = document.getElementById("paidMethod").value;
    var allFields = document.querySelectorAll(".payment-method-fields");
    allFields.forEach(function(field) {
        field.style.display = "none";
    });

    if (selectedMethod) {
        var fieldsToShow = document.getElementById(selectedMethod.toLowerCase() + "Fields");
        if (fieldsToShow) {
            fieldsToShow.style.display = "block";
        }
    }
}
