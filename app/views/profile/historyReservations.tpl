<p></p>
<div class="card shadow-lg">
    <div class="card-body bg-light">
        <h5 class="card-title">Historia dokonanych rezerwacji</h5>
        {if not empty($history)}
        <p class="card-text">Lista wszystkich dokonanych rezerwacji <i>(z wyłączeniem rezerwacji aktywnych).</i></p>
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
                    </tr>
                </thead>
                <tbody>

                {foreach $history as $volume}
                {if $volume['status_desc'] eq 'finished'}
                    <tr>
                        <td>{$volume['id_volume']}</th>
                        <td>{$volume['author']}</td>
                        <td>{$volume['title']}</td>
                        <td>{$volume['start_date']}</td>
                        <td>{$volume['end_date']}</td>
                        <td><i>{$volume['status_desc']}</i></td>
                    </tr>
                {/if}
                {/foreach}
                    
                </tbody>
            </table>
        </div>
        {else}
            Nie masz jeszcze historii rezerwacji
        {/if}
    </div>
</div>