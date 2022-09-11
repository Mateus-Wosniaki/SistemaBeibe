$(document).ready(function () {
    getEstados();
    $("#estado").change(function () {
        getCidades();
    });
});

function getEstados() {
    const url = "/SistemaBeibe/AJAXServlet";
    $.ajax({
        url: url,
        data: {
            action: "estados"
        },
        dataType: 'json',
        success: function (data) {
            // Se sucesso, preenche o combo de estado
            $("#estado").empty();
            $.each(data, function (i, obj) {
                $("#estado").append('<option value=' + obj.estadoId + '>' + obj.descricao + '</option>');
            });
        },
        error: function (request, textStatus, errorThrown) {
            alert(request.status + ', Erro: ' + request.statusText);
            // Erro
        }
    });
}

function getCidades() {
    const estadoId = $("#estado").val();
    const url = "/SistemaBeibe/AJAXServlet";
    $.ajax({
        url: url, // URL da sua Servlet
        data: {
            estadoId: estadoId,
            action: "cidades",
        }, // Parâmetro passado para a Servlet
        dataType: 'json',
        success: function (data) {
            // Se sucesso, limpa e preenche a combo de cidade
            // alert(JSON.stringify(data));
            $("#cidade").empty();
            $.each(data, function (i, obj) {
                $("#cidade").append('<option value=' + obj.cidadeId + '>' + obj.descricao + '</option>');
            });
        },
        error: function (request, textStatus, errorThrown) {
            alert(request.status + ', Erro: ' + request.statusText);
            // Erro
        }
    });
}

