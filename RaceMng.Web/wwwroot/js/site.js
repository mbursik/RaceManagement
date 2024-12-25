// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

$(function () {
  var placeholderModal = $('#placeholder-modal');
  var placeholderConfirm = $('#placeholder-confirm');
  //------------------------------------------------------------------------------------------------
  //Modal form
  //------------------------------------------------------------------------------------------------
  $('[data-toggle="show-modal"]').on('click', (e) => {
    var url = $(e.currentTarget).data('url');
    //var actName = $(e.currentTarget).data('actname');

    $.get(url).done((data) => {
      placeholderModal.html(data);
      placeholderModal.find('.modal').modal('show');

      //switch (actName) {
      //    case 'CreateRelease':
      //        $("#Year, #CountryID").change((e) => {

      //        });
      //        break;
      //}

    }).fail((xhr, status, error) => {
      errMsgAlert(xhr);
    });


  });


  //save data from modal form
  placeholderModal.on('click', '[data-toggle="save-modal"]', (e) => {
    var actName = $(e.currentTarget).data('actname');

    switch (actName) {
      //case 'CreateAnnualDemand':
      //break;

      default:
        var form = $(e.currentTarget).parents('.modal').find('form');

        $.validator.unobtrusive.parse(form);

        if (form.valid()) {

          var actionUrl = form.attr('action');
          var sendData = form.serialize();
          $.post(actionUrl, sendData).done((data) => {
            if (data == "Ok" || data == "") {
              placeholderModal.find('.modal').modal('hide');
              location.reload();
            }
            else {
              placeholderConfirm.html(data);
              placeholderConfirm.find('.modal').modal('show');
              $(".modal-backdrop").css("z-index", "1056");
            }

          }).fail((xhr, status, error) => {
            errMsgAlert(xhr);
          });

        }
        else return false;


    }


  });

  placeholderModal.on('click', '[data-toggle="hide-modal"]', (e) => {
    placeholderModal.find('.modal').modal('hide');
  });


  //------------------------------------------------------------------------------------------------
  //Confirm form
  //------------------------------------------------------------------------------------------------
  $('[data-toggle="show-confirm"]').click((e) => {
    var url = $(e.currentTarget).data('url');
    var actName = $(e.currentTarget).data('actname');

    switch (actName) {
      //case 'xxx':
      default:
        $.get(url).done((data) => {
          placeholderConfirm.html(data);
          placeholderConfirm.find('.modal').modal('show');
          //placeholderModal.append(data);
          //placeholderConfirm.find('[data-component="confirm"] .modal').modal('show');
          
        });

    }

  });

/*
  //save data from confirm form
  placeholderConfirm.on('click', '[data-toggle="save-confirm"]', (e) => {
    var actName = $(e.currentTarget).data('actname');


    //switch (actName) {

    //  case 'ConfirmDelete':

    //    var form = $(e.currentTarget).parents('.modal').find('form');
    //    var actionUrl = form.attr('action');
    //    var sendData = form.serialize();

    //    $.post(actionUrl, sendData).done((data) => {
    //      placeholderConfirm.find('.modal').modal('hide');
    //      location.reload();

    //    }).fail((xhr, status, error) => {
    //      errMsgAlert(xhr);
    //    });

    //    break;
     
    //}

  });
  */

  //close confirm form
  placeholderConfirm.on('click', '[data-toggle="hide-confirm"]', (e) => {
    placeholderConfirm.find('.modal').modal('hide');
    $(".modal-backdrop").css("z-index", "1050");
  });


});



// Definování nové metody jako součásti jQuery
$.fn.setupAutocomplete = function (url) {
  return this.each(function () {
    $(this).autocomplete({
      source: function (request, response) {
        $.post(url, { "term": request.term }).done((data) => {
          response($.map(data, function (item) {
            return item;
          }));
        }).fail((xhr, status, error) => {
          errMsgAlert(xhr);
        });
      }
    });
  });
};



const errMsgAlert = (xhr) => {
  alert('ERROR - ' + xhr.status + ' - ' + xhr.statusText + '\n' /*+ moment().format()*/ + '\n' + xhr.responseText);
}
