(function(window) {
    'use strict';

    // This function will contain all our code
    function lignePaginate() {
        var _lignePaginate = {};

        /**
     
Initialize all settings and validations before running
         pagination and filter (if assigned)
         **/
        _lignePaginate.init = function(el, options = { numberPerPage: 10, goBar: false, pageCounter: true }, filter = [{ el: null }]) {
                setTableEl(el);
                initTable(_lignePaginate.getEl());
                checkIsTableNull();
                setOptions(options);
                setConstNumberPerPage(options.numberPerPage);
                setFilterOptions(filter);
                launchPaginate();
            }
            /**
             * 
Paging settings
             **/
        var settings = {
            el: null,
            table: null,
            numberPerPage: 10,
            constNumberPerPage: 10,
            numberOfPages: 0,
            goBar: false,
            pageCounter: true,
            hasPagination: true,
        };

        var filterSettings = {
            el: null,
            filterBox: null,
            trs: null,
        }

        /**
         * Setters private
         **/

        var setConstNumberPerPage = function(number) {
            settings.constNumberPerPage = number;
        }
        var setNumberPerPage = function(number) {
            settings.numberPerPage = number;
        }

        var initTable = function(el) {
            if (el.indexOf('#') > -1) {
                settings.table = document.getElementById(el.replace('#', '').trim());
            } else if (el.indexOf('.') > -1) {
                settings.table = document.querySelector(el);
            }
        }

        var iniFilter = function(el) {
            if (el.indexOf('#') > -1) {
                filterSettings.filterBox = document.getElementById(el.replace('#', '').trim());
            } else if (el.indexOf('.') > -1) {
                filterSettings.filterBox = document.querySelector(el);
            }
        }

        var setTableEl = function(el) {
            settings.el = el;
        }

        var setFilterOptions = function(filterOptions) {
            if (filterOptions.el != null) {
                setFilterEl(filterOptions.el);
                iniFilter(filterSettings.el);
                checkIsFilterBoxNull();
                setFunctionInFilterBox();
            }
        }

        var setFilterEl = function(el) {
            filterSettings.el = el;
        }

        var setFunctionInFilterBox = function() {
            filterSettings.filterBox.setAttribute('onkeyup', 'paginate.filter()')
        }

        var setGoBar = function(value) {
            settings.goBar = value;
        }

        var setPageCounter = function(value) {
            settings.pageCounter = value;
        }

        /**
         * Getters public
         **/


        _lignePaginate.getEl = function() {
            return settings.el;
        }
        _lignePaginate.getTable = function() {
            return settings.table;
        }
        _lignePaginate.getNumberPerPage = function() {
            return settings.numberPerPage;
        }

        _lignePaginate.getConstNumberPerPage = function() {
            return settings.constNumberPerPage;
        }

        /**
         * Private Methods
         **/

        var table, tr = [],
            pageCount, numberPerPage, th;

        var setOptions = function(options) {
            if (options.numberPerPage != settings.numberPerPage) {
                setNumberPerPage(options.numberPerPage);
            }

            if (typeof options.goBar === 'boolean')
                setGoBar(options.goBar);

            if (typeof options.pageCounter === 'boolean')
                setPageCounter(options.pageCounter);
        }

        var checkIsTableNull = function() {
            if (settings.table == null) {
                throw new Error('Element ' + _lignePaginate.getEl() + ' no exits');
            }
        }

        var checkIsFilterBoxNull = function() {
            if (filterSettings.filterBox == null) {
                throw new Error('Element ' + _lignePaginate.getEl() + ' no exits');
            }
        }

        var paginateAlreadyExists = function() {
            let paginate = document.querySelector('div.paginate');
            if (paginate != null)
                removePaginate(paginate);
        }

        var removePaginate = function(element) {
            element.parentNode.removeChild(element);
        }

        var hiddenPaginateControls = function() {
            document.querySelector('.paginate_controls').style.visibility = 'hidden';
        }

        var showPaginatecontrols = function() {
            document.querySelector('.paginate_controls').style.visibility = 'unset';
        }

        // (numberOfPage): número de páginas, (currentPage): página actual, la página seleccionada ..
        var pageButtons = function(numberOfPage, currentPage) {
                /** Estas variables deshabilitarán el botón "Prev" en la
                 * primera página y el botón "siguiente" en la ultima
                 **/
                let prevDisabled = (currentPage == 1) ? "disabled" : "";
                let nextDisabled = (currentPage == numberOfPage) ? "disabled" : "";

                /** Este (botones) creara todos los botones necesarios
                 * creará cada botón y establece el atributo onclick
                 * a la función "order" con un número especial (currentPage)
                 *
                 * Tambien se encarga de agregar el boton de "gotopage" y "pagecounter"
                 **/
                let buttons = "<input type='button' value='← prev' class='paginate_control_prev' onclick='paginate.sort(" + (currentPage - 1) + ")' " + prevDisabled + ">";
                let buttonNumberOfPage = "<input type='button' value='" + currentPage + ' - ' + numberOfPage + "' disabled>";

                for (let $i = 1; $i <= numberOfPage; $i++) {
                    if (numberOfPage > 10) {
                        buttons += paginationMoreThatTenPage($i, numberOfPage);
                    } else {
                        buttons += "<input type='button' id='id" + $i + "'value='" + $i + "' onclick='paginate.sort(" + $i + ")'>";
                    }
                }

                let nextButton = "<input type='button' value='next →' class='paginate_control_next' onclick='paginate.sort(" + (currentPage + 1) + ")' " + nextDisabled + ">";
                buttons += nextButton;

                if (settings.pageCounter)
                    buttons += buttonNumberOfPage;

                if (settings.goBar)
                    buttons += addGoToPage();

                return buttons;
            }
            /**
             * When the number of pages exceeds 10, a mechanism is created that hides
             * all pages with a number greater than 4 and less than the last page
             *
             * When browsing the page only the current number will be displayed
             *Initial
             *      <- prev  (1)    2   3   4   ... 41 next ->
             * Then
             *      <- prev  1    2   3   4  (22)   ... 41 next ->
             **/
        var paginationMoreThatTenPage = function(iterator, numberOfPage) {

            let referenceForTheLast = numberOfPage - 1;
            let middleValue = '...';

            if (iterator > referenceForTheLast || iterator < 5) {
                return "<input type='button' id='id" + iterator + "'value='" + iterator + "' onclick='paginate.sort(" + iterator + ")'>";
            } else if ((iterator + 1) == numberOfPage) {
                return middleValue + "<input type='button' id='id" + iterator + "'value='" + iterator + "' style='display: none' onclick='paginate.sort(" + iterator + ")'>";
            } else {
                return "<input type='button' id='id" + iterator + "'value='" + iterator + "' style='display: none' onclick='paginate.sort(" + iterator + ")'>";
            }
        }

        var addGoToPage = function() {
            let inputBox = "<input type='number' id='paginate_page_to_go' value='1' min='1' max='" + settings.numberOfPages + "'>";
            let goButton = "<input type='button' id='paginate-go-button' value='Go' onclick='paginate.goToPage()'>  ";
            return inputBox + goButton;
        }

        /**
         * Public Methods
         **/

        _lignePaginate.goToPage = function() {
            let page = document.getElementById("paginate_page_to_go").value;
            _lignePaginate.sort(page);
        }

        var launchPaginate = function() {
            paginateAlreadyExists();
            table = settings.table;
            numberPerPage = settings.numberPerPage;
            let rowCount = table.rows.length;
            //get the name of the label of the first cell (in the first row)
            let firstRow = table.rows[0].firstElementChild.tagName;
            // Checking if the table has header
            let hasHead = (firstRow === "TH");
            // loop counters, to start counting from rows [1] (2nd row) if the first row has a heading tag
            let $i, $ii, $j = (hasHead) ? 1 : 0;
            // contains the first row if it has a (<th>) and nothing if (<td>)
            th = (hasHead ? table.rows[(0)].outerHTML : "");
            pageCount = Math.ceil(rowCount / numberPerPage);
            settings.numberOfPages = pageCount;

            if (pageCount > 1) {
                settings.hasPagination = true;
                for ($i = $j, $ii = 0; $i < rowCount; $i++, $ii++)
                    tr[$ii] = table.rows[$i].outerHTML;
                // Container for "paginate_controls" buttons
                table.insertAdjacentHTML("afterend", "<div id='buttons' class='paginate paginate_controls'></div");
                // Initializing the table on page 1
                _lignePaginate.sort(1);
            } else {
                settings.hasPagination = false;
            }
        };

        _lignePaginate.sort = function(selectedPageNumber) {
            /** create (rows) a variable to contain the row group
             * to be displayed on the selected page,
             *startPoint: the first row on each page, Do The Math
             **/
            let rows = th,
                startPoint = ((settings.numberPerPage * selectedPageNumber) - settings.numberPerPage);
            for (let $i = startPoint; $i < (startPoint + settings.numberPerPage) && $i < tr.length; $i++)
                rows += tr[$i];

            table.innerHTML = rows;
            document.getElementById("buttons").innerHTML = pageButtons(pageCount, selectedPageNumber);
            document.getElementById("id" + selectedPageNumber).classList.add('active');
            /**
             * This is used to display the number of the page you are on.
             * generally used when pages are greater than 10
             **/
            document.getElementById("id" + selectedPageNumber).style.display = 'unset';
        }

        /**
         * This is responsible for filtering the information according to a text box
         * also calls the method that hides the button part of the
         * pagination
         **/
        _lignePaginate.filter = function() {
            if (settings.hasPagination) {
                setNumberPerPage(9999);
                _lignePaginate.sort(1);
                hiddenPaginateControls();
            }
            const filter = document.querySelector(filterSettings.el).value.toUpperCase();
            const trs = document.querySelectorAll(settings.el + ' tr:not(.header)');
            trs.forEach(tr => tr.style.display = [...tr.children].find(td => td.innerHTML.toUpperCase().includes(filter)) ? '' : 'none');

            if (filter.length == 0 && settings.hasPagination) {
                setNumberPerPage(_lignePaginate.getConstNumberPerPage());
                _lignePaginate.sort(1);
                showPaginatecontrols();
            }

        }

        return _lignePaginate;
    }

    if (typeof(window.paginate) === 'undefined') {
        window.paginate = lignePaginate();
    }
})(window);