<html>
    <head>
        <!DOCTYPE html>
        <script src="{{base_url}}static/jquery/jquery-latest.min.js"></script>
        <script src="{{base_url}}static/semantic/semantic.min.js"></script>
        <script src="{{base_url}}static/jquery/tablesort.js"></script>
        <link rel="stylesheet" href="{{base_url}}static/semantic/semantic.min.css">

        <link rel="apple-touch-icon" sizes="180x180" href="{{base_url}}static/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="{{base_url}}static/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="{{base_url}}static/favicon-16x16.png">
        <link rel="manifest" href="{{base_url}}static/site.webmanifest">
        <link rel="mask-icon" href="{{base_url}}static/safari-pinned-tab.svg" color="#5bbad5">
        <link rel="shortcut icon" href="{{base_url}}static/favicon.ico">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="msapplication-config" content="{{base_url}}static/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">

        <title>Plex - Oscarr</title>

        <style>
            body {
                background-color: #272727;
            }
            #fondblanc {
                background-color: #ffffff;
                border-radius: 0px;
                box-shadow: 0px 0px 5px 5px #ffffff;
                margin-top: 32px;
                margin-bottom: 3em;
                padding: 2em 3em 2em 3em;
            }
            .table {
                padding-top: 1em;
            }
        </style>
    </head>
    <body>
        <div id='loader' class="ui page dimmer">
            <div class="ui indeterminate text loader">Loading...</div>
        </div>
        % include('menu.tpl')

        <div id="fondblanc" class="ui container">
            <div class="ui top attached tabular menu">
                <a class="tabs item active" data-tab="episodes">Latest episodes</a>
                <a class="tabs item" data-tab="movies">Latest movies</a>
            </div>

            <div class="ui bottom attached tab segment active" data-tab="episodes">
                <table class="ui very basic selectable table">
                    <thead>
                        <tr>
                            <th class="one wide"></th>
                            <th class="six wide">Series</th>
                            <th class="one wide right aligned">Episode</th>
                            <th class="six wide">Episode Title</th>
                            <th class="two wide">Date Added</th>
                        </tr>
                    </thead>
                    <tbody>
                    %for row in series_list:
                        <tr class="selectable">
                            %if row[0] == True:
                            <td class="right aligned"><i class="unhide icon"></i></td>
                            %else:
                            <td></td>
                            %end
                            <td>{{row[1]}}</td>
                            <td class="right aligned">{{str(row[3]) + 'x' + str(row[4]).zfill(2)}}</td>
                            <td>{{row[2]}}</td>
                            <td>{{row[5]}}</td>
                        </tr>
                    %end
                    </tbody>
                </table>
            </div>

            <div class="ui bottom attached tab segment" data-tab="movies">
                <table class="ui very basic selectable table">
                    <thead>
                        <tr>
                            <th class="one wide"></th>
                            <th class="thirteen wide">Movies</th>
                            <th class="two wide">Date Added</th>
                        </tr>
                    </thead>
                    <tbody>
                    %for row in movies_list:
                        <tr class="selectable">
                            %if row[0] == True:
                            <td class="right aligned"><i class="unhide icon"></i></td>
                            %else:
                            <td></td>
                            %end
                            <td>{{row[1]}}</td>
                            <td>{{row[2]}}</td>
                        </tr>
                    %end
                    </tbody>
                </table>
            </div>
        </div>

        % include('footer.tpl')
    </body>
</html>


<script>
    $('.tabular.menu .item').tab();

    $('a:not(.tabs), button:not(.cancel)').click(function(){
        $('#loader').addClass('active');
    })
</script>