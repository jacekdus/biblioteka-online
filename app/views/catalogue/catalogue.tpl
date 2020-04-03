{if not $volumes eq NULL}
    <p></p>
    <div class="card shadow-lg">
        <div class="card-body bg-light">
            <h5 class="card-title">Katalog biblioteki</h5>
            <p class="card-text">Poniżej znajdują się szczegółowo opisane woluminy do wypożyczenia, wraz z możliwością rezerwacji <i>(o ile pozycja nie została wcześniej zarezerwowana).</i>
            </p>
            <div class="table-responsive">
                <table class="table table-sm table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Autor</th>
                            <th scope="col">Tytuł</th>
                            <th scope="col">Rok wydania</th>
                            <th scope="col">Rezerwacja</th>
                            <th scope="col">Koniec rezerwacji</th>
                        </tr>
                    </thead>
                    <tbody>

                    {foreach $volumes as $volume}
                        <form action="{$conf->action_root}reserve" method="post"> 
                        {if not isset($volume["status"])} 

                            <tr>

                        {else} 

                            <tr class="font-italic table-secondary text-muted">

                        {/if}

                                <th scope="row">{$volume["id"]}</th>
                                <td scope="row">{$volume["author"]}</td>
                                <td scope="row">{$volume["title"]}</td>
                                <td scope="row">{$volume["year_publication"]}</td>

                                <td scope="row" class="text-center">

                        {if not isset($volume["status"])}

                                    <input type="hidden" name="idVolume" value="{$volume["id"]}">
                                    <button type="submit" class="btn btn-sm btn-secondary btn-block">Zarezerwuj</button>
                                </td>
                                <td scope="row"></td>
                        {else}

                                    Niedostępna
                                </td>
                                <td scope="row">{$volume["end_date"]}</td>

                        {/if}
                                
                            </tr>
                        </form> 
                    {/foreach}

                    </tbody>
                </table>
            </div>
        </div>
    </div>
{/if}