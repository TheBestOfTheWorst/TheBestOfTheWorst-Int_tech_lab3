function printDataTable() {
    // определяем, какое задание нужно выполнить
    let mainSelect = document.getElementsByName('mainSelect')[0];

    const xmlhttp = new XMLHttpRequest();

    // удаляем все предыдущие таблицы
    var tables = document.getElementsByTagName('table');
    for (var i = tables.length; i-- > 0;)
        tables[i].parentNode.removeChild(tables[i]);

    switch (mainSelect.selectedIndex) {
        // в формате простого текста
        case 0: xmlhttp.onload = function () {
            document.body.innerHTML += this.responseText;
        }
            break;
        // в формате XML
        case 1:
            let myTable = "<table border=1>";

            xmlhttp.responseType = 'document';
            xmlhttp.onload = function () {
                const xmlDoc = xmlhttp.responseXML;
                const data = xmlDoc.getElementsByTagName("data");

                // если данных не обнаружено, то завершаем работу
                if (data[0].childNodes[0].childNodes.length == 0) {
                    alert("Информации не обнаружено!");
                    return;
                }

                for (let i = 0; i < data[0].childNodes.length; i++) {
                    myTable += "<tr><td>" +
                        data[0].childNodes[i].getElementsByTagName("ID_Computer")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("netname")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("motherboard")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("RAM_Capacity")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("HDD_Capacity")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("monitor")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("vendor")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("guarantee")[0].childNodes[0].nodeValue +
                        "</td><td>" +
                        data[0].childNodes[i].getElementsByTagName("FID_processor")[0].childNodes[0].nodeValue +
                        "</td></tr>";
                }
                myTable += "</table>";
                document.body.innerHTML += myTable;
            }
            break;
        // в формате JSON
        case 2: xmlhttp.onload = function () {
            let jsonData = JSON.parse(this.responseText);

            let myTable = "<table border=1>";
            for (var i = 0; i < jsonData.length; i++) {
                myTable += '<tr>';
                Object.keys(jsonData[i]).forEach(function (key) {
                    myTable += '<td>' + jsonData[i][key] + '</td>';
                });
                myTable += '</tr>';
            }
            myTable += "</table>";
            document.body.innerHTML += myTable;
        }
            break;
    }

    xmlhttp.open("POST", "GetData.php");
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    let procTypes = document.getElementsByName('procTypes')[0];
    let softTypes = document.getElementsByName('softTypes')[0];
    let ms = mainSelect.options[mainSelect.selectedIndex].text;
    let pt = procTypes.options[procTypes.selectedIndex].text;
    let st = softTypes.options[softTypes.selectedIndex].text;
    let str = "mainSelect=" + ms + "&procTypes=" + pt + "&softTypes=" + st;

    xmlhttp.send(str);
}