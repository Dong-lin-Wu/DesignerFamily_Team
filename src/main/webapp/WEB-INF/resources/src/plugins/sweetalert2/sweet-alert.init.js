!function ($) {
    "use strict";

    var SweetAlert = function () {
    };

    //examples
    SweetAlert.prototype.init = function () {

        //Basic
        $('#sa-basic').on('click', function () {
            swal('Any fool can use a computer')
        });

        //A title with a text under
        $('#sa-title').click(function () {
            swal(
                'The Internet?',
                'That thing is still around?',
                'question'
            )
        });

        //Success Message
        $('#sa-success').click(function () {
            swal(
                {
                    title: 'Good job!',
                    text: 'You clicked the button!',
                    type: 'success',
                    showCancelButton: true,
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger'
                }
            )
        });

        //Error Message
        $('#sa-error').click(function () {
            swal(
                {
                    type: 'error',
                    title: 'Oops...',
                    text: 'Something went wrong!',
                }
            )
        });

        //Warning Message
        $('.delmember').click(function () {
            let tr = $(this).parent().parent().parent().parent();
            let id = tr.children(".table-plus").text();

            swal({
                title: '確定刪除?',
                text: "資料刪除後將無法復原!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                confirmButtonText: '確定',
                cancelButtonText: '取消'
            }).then((result) => {
                if (result.dismiss !== 'cancel') {
                    $.ajax({
                        type: 'delete',
                        url: '/member/members.delete/' + id
                    });

                    $('.data-table-export').DataTable().row(tr).remove().draw(false);

                    swal({
                        title: '已刪除!',
                        type: 'success',
                        confirmButtonText: '確定'
                    });
                }
            })
        });

        $('.deldesigner').click(function () {
            let tr = $(this).parent().parent().parent().parent();
            let id = $(this).parent().parent().parent().parent().children(".table-plus").text();

            swal({
                title: '確定取消設計師資格?',
                text: "",
                type: 'warning',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                confirmButtonText: '確定',
                cancelButtonText: '取消'
            }).then((result) => {
                if (result.dismiss !== 'cancel') {
                    $.ajax({
                        type: 'delete',
                        url: '/member/designers.delete/' + id
                    });

                    $('.data-table-export').DataTable().row(tr).remove().draw(false);

                    swal({
                        title: '已取消!',
                        type: 'success',
                        confirmButtonText: '確定'
                    });
                }
            })
        });

        //Custom Position Message
        $('#sa-custom-position').click(function () {
            swal(
                {
                    position: 'top-end',
                    type: 'success',
                    title: 'Your work has been saved',
                    showConfirmButton: false,
                    timer: 1500
                }
            )
        });

        //Parameter
        $('#sa-params').click(function () {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                confirmButtonClass: 'btn btn-success margin-5',
                cancelButtonClass: 'btn btn-danger margin-5',
                buttonsStyling: false
            }).then(function () {
                swal(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                )
            }, function (dismiss) {
                // dismiss can be 'cancel', 'overlay',
                // 'close', and 'timer'
                if (dismiss === 'cancel') {
                    swal(
                        'Cancelled',
                        'Your imaginary file is safe :)',
                        'error'
                    )
                }
            })
        });

        //Custom Image
        $('#sa-image').click(function () {
            swal({
                title: 'Sweet!',
                text: 'Modal with a custom image.',
                imageUrl: 'vendors/images/deskapp-color-logo.png',
                imageHeight: 30,
                animation: false
            })
        });

        //Auto Close Timer
        $('#sa-close').click(function () {
            swal({
                title: 'Auto close alert!',
                text: 'I will close in 2 seconds.',
                timer: 2000
            }).then(
                function () {
                },
                // handling the promise rejection
                function (dismiss) {
                    if (dismiss === 'timer') {
                        console.log('I was closed by the timer')
                    }
                }
            )
        });

        //custom html alert
        $('#terms').click(function () {
            swal({
                html: '',
                showCloseButton: true,
                showConfirmButton: false,
                showCancelButton: false
            })
        });

        $('#policy').click(function () {
            swal({
                html: '',
                showCloseButton: true,
                showConfirmButton: false,
                showCancelButton: false
            })
        });

        //Custom width padding
        $('#custom-padding-width-alert').click(function () {
            swal({
                title: 'Custom width, padding, background.',
                width: 600,
                padding: 100,
                background: '#fff url(vendors/images/img1.jpg)'
            })
        });

        //Ajax
        $('#ajax-alert').click(function () {
            swal({
                title: 'Submit email to run ajax request',
                input: 'email',
                showCancelButton: true,
                confirmButtonText: 'Submit',
                showLoaderOnConfirm: true,
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                preConfirm: function (email) {
                    return new Promise(function (resolve, reject) {
                        setTimeout(function () {
                            if (email === 'taken@example.com') {
                                reject('This email is already taken.')
                            } else {
                                resolve()
                            }
                        }, 2000)
                    })
                },
                allowOutsideClick: false
            }).then(function (email) {
                swal({
                    type: 'success',
                    title: 'Ajax request finished!',
                    html: 'Submitted email: ' + email
                })
            })
        });

        //chaining modal alert
        $('#chaining-alert').click(function () {
            swal.setDefaults({
                input: 'text',
                confirmButtonText: 'Next &rarr;',
                showCancelButton: true,
                animation: false,
                progressSteps: ['1', '2', '3']
            })

            var steps = [
                {
                    title: 'Question 1',
                    text: 'Chaining swal2 modals is easy'
                },
                'Question 2',
                'Question 3'
            ]

            swal.queue(steps).then(function (result) {
                swal.resetDefaults()
                swal({
                    title: 'All done!',
                    html: 'Your answers: <pre>' +
                        JSON.stringify(result) +
                        '</pre>',
                    confirmButtonText: 'Lovely!',
                    showCancelButton: false
                })
            }, function () {
                swal.resetDefaults()
            })
        });

        //Danger
        $('#dynamic-alert').click(function () {
            swal.queue([{
                title: 'Your public IP',
                confirmButtonText: 'Show my public IP',
                text: 'Your public IP will be received ' +
                    'via AJAX request',
                showLoaderOnConfirm: true,
                preConfirm: function () {
                    return new Promise(function (resolve) {
                        $.get('https://api.ipify.org?format=json')
                            .done(function (data) {
                                swal.insertQueueStep(data.ip)
                                resolve()
                            })
                    })
                }
            }])
        });


    },
        //init
        $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert
}(window.jQuery),

    //initializing
    function ($) {
        "use strict";
        $.SweetAlert.init()
    }(window.jQuery);