$(document).ready(()->
    #STATE  = 'BEGIN' OR 'END' OR 'SHOW MESSAGE'
    $.fn.wait = (data)->
        if data == undefined
            data = 
                state : 'begin'
                message: ''
                time_out: '1000'

        if data.state == 'begin' || data.state == 'end' || data.state == 'show_message'
            this.each(()->
                that = this
                if $(that).css('position') == undefined
                    $(that).css('position','relative')
                if $(that).css('z-index') == undefined || $(that).css('z-index') == 'auto'
                    $(that).css('z-index','2')

                if data.state == 'begin' || data.state == 'show_message'
                    width = $(that).innerWidth()
                    height = $(that).innerHeight()
                    positions = $(that).position()
                    position_left = positions.left
                    #position_left += parseInt($(that).css('margin-left'))
                    position_top = positions.top
                    #position_top += parseInt($(that).css('margin-top'))
                    z_index = parseInt($(that).css('z-index'))+900

                    div_wait = $(document.createElement('div'))
                    div_wait.addClass('wait_div')
                    p_chargement = $(document.createElement('p'))
                    span_chargement = $(document.createElement('span'))
                    
                    if data.message == '' || data.message == undefined
                        data.message = ' Please wait ... '

                    if data.state == 'show_message'
                        span_chargement.text(data.message)
                    else 
                        span_chargement.text(data.message)

                    p_chargement.append(span_chargement)
                    div_wait.css(
                        'position':'absolute'
                        'top':position_top+'px'
                        'left':position_left+'px'
                        'z-index':z_index
                        'height':height+'px'
                        'width':width+'px'
                    )
                    div_wait.append(p_chargement)
                    $(that).before(div_wait)


                if data.state == 'show_message'
                    if data.time_out == '' || isNaN(data.time_out)
                        data.time_out = 2000 
                    div_wait.on('click',()->
                        $(this).remove()
                    )
                    setTimeout(()->
                        if $(that).prev('.wait_div').length > 0
                            div_wait.remove()
                    , data.time_out)

                if data.state == 'end'
                    $(that).prev('.wait_div').remove()
            )

        return this
)