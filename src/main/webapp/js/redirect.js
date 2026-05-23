document.addEventListener('DOMContentLoaded', function () {
       const rooms = document.querySelectorAll('.room');

       rooms.forEach(room => {
           room.addEventListener('click', function () {
               const roomId = this.getAttribute('data-room-id');
               if (roomId) {
                   window.location.href = `roomDetails.jsp?rid=${roomId}`;
               }
           });
       });
   });

