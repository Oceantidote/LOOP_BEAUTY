import flatpickr from 'flatpickr'
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

const initFlatpicker = () => {
    flatpickr('#filter_from', {
        maxDate: Date.now(),
        plugins: [
            new rangePlugin({ input: '#filter_to' })
        ]
    })
}

export default initFlatpicker

