import $ from 'jquery'
import tablesorter from 'tablesorter'

$.tablesorter = tablesorter

const initTablesorter = () => {
    $('#analytics-table').tablesorter()
}

export default initTablesorter