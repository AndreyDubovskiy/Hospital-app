$(document).ready(function() {
    $('.delete-link').on('click', function(e) {
        e.preventDefault();

        // Відправляємо DELETE-запит на сервер
        $.ajax({
            url: $(this).attr('href'),
            type: 'DELETE',
            success: function(result) {
                // Обробляємо успішну відповідь від сервера
                console.log('DELETE request success:', result);
                // Додайте додаткову логіку, яка вам потрібна
            },
            error: function(error) {
                // Обробляємо помилку від сервера
                console.log('DELETE request error:', error);
                // Додайте додаткову логіку, яка вам потрібна
            }
        });
    });
});