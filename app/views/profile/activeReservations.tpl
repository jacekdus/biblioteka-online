<p></p>
<div class="card shadow-lg">
    <div class="card-body bg-light">
        <h5 class="card-title">Aktywne rezerwacje</h5>
        {if not empty($reserved)}
        <p class="card-text">Poniżej znajduje się lista wszystkich aktywnych rezerwacji <i>(lista jest pusta, jeżeli nie masz żadnych aktywnych rezerwacji).</i></p>
        <div class="table-responsive">
            <table class="table table-sm table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>#</th>
                        <th>Autor</th>
                        <th>Tytuł</th>
                        <th>Data rezerwacji</th>
                        <th>Data zakończenia</th>
                        <th>Status</th>
                        <th>Akcja</th>
                    </tr>
                </thead>
                <tbody>
                    
                {foreach $reserved as $volume}
                {if $volume['status_desc'] neq 'finished'}
                    <form action="{$conf->action_root}releaseVolume" method="post">
                        <tr>
                            <td>{$volume['id_volume']}</th>
                            <td>{$volume['author']}</td>
                            <td>{$volume['title']}</td>
                            <td>{$volume['start_date']}</td>
                            <td>{$volume['end_date']}</td>
                            <td>
                                <i>
                                {if $volume['status_desc'] eq 'reserved'}<span class="badge badge-danger">{$volume['status_desc']}</span>{/if}
                                {if $volume['status_desc'] eq 'ready'}<span class="badge badge-success">{$volume['status_desc']}</span>{/if}
                                {if $volume['status_desc'] eq 'received'}<span class="badge badge-warning">{$volume['status_desc']}</span>{/if}
                                {if $volume['status_desc'] eq 'finished'}<span class="badge badge-secondary">{$volume['status_desc']}</span>{/if}
                                </i>
                            </td>
                            <td>
                            {if $volume['status_desc'] neq 'received'}
                                <button type="submit" class="btn btn-warning btn-block">Zwolnij</button>
                            {/if}
                            </td>
                        </tr>
                        <input type="hidden" name="id" value="{$volume['id']}">
                    </form>
                {/if}    
                {/foreach}
                    
                </tbody>
            </table>
        </div>
        {else}
            Nie masz aktywnych rezerwacji
        {/if}
    </div>
</div>