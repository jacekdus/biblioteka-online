
<p></p>
<div class="card shadow-lg">
    <div class="card-body bg-light">
        <h5 class="card-title">Wszystkie rezerwacje</h5>
        <div class="table-responsive">
            <table class="table table-sm table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>#</th>
                        <th>Autor</th>
                        <th>Tytuł</th>
                        <th>User</th>
                        <th>Data rezerwacji</th>
                        <th>Data zakończenia</th>
                        <th>Status</th>
                        <th colspan="3">Zmiana statusu</th>
                    </tr>
                </thead>
                <tbody>
                
                {foreach $reservations as $res}
                    <form action="{$conf->action_root}changeStatus" method="post">
                        <tr>
                            <th>{$res['id_volume']}</th>
                            <td>{$res['author']}</td>
                            <td>{$res['title']}</td>
                            <td>{$res['login']}</td>
                            <td>{$res['start_date']}</td>
                            <td>{$res['end_date']}</td>
                            <!-- STATUS REZERWACJI: 
                            Zarezerwowana       - reserved, 
                            Gotowa do odebrania - ready, 
                            Odebrana            - received, 
                            Zakończona          - finished -->
                            <td>
                                <i>
                                {if $res['status_desc'] eq 'reserved'}<span class="badge badge-danger">{$res['status_desc']}</span>{/if}
                                {if $res['status_desc'] eq 'ready'}<span class="badge badge-success">{$res['status_desc']}</span>{/if}
                                {if $res['status_desc'] eq 'received'}<span class="badge badge-warning">{$res['status_desc']}</span>{/if}
                                {if $res['status_desc'] eq 'finished'}<span class="badge badge-secondary">{$res['status_desc']}</span>{/if}
                                </i>
                            </td>

                            {if $res['status_desc'] neq 'reserved'}
                            <td><button name="status" value="reserved" type="submit" class="btn btn-sm btn-block btn-danger">Zarez..</button></td>
                            {/if}

                            {if $res['status_desc'] neq 'ready'}
                            <td><button name="status" value="ready" type="submit" class="btn btn-sm btn-block btn-success">Gotowa</button></td>
                            {/if}
                            
                            {if $res['status_desc'] neq 'received'}
                            <td><button name="status" value="received" type="submit" class="btn btn-sm btn-block btn-warning">Odebr..</button></td>
                            {/if}

                            {if $res['status_desc'] neq 'finished'}
                            <td><button name="status" value="finished" type="submit" class="btn btn-sm btn-block btn-secondary">Zakoń..</button></td>  
                            {/if}

                        </tr>
                        <input type="hidden" name="id" value="{$res['id']}">
                    </form>
                {/foreach}
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
{* {$reservations|var_dump} *}