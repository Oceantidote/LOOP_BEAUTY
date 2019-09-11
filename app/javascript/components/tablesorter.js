import $ from 'jquery'
import tablesorter from 'tablesorter'

$.tablesorter = tablesorter

console.log($.tablesorter.widgets)

const initTablesorter = () => {
    $('#analytics-table').tablesorter({
        cssIgnoreRow: '.total-row'
    })
}

export default initTablesorter
