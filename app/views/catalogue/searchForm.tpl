<p></p>
<div class="card shadow-lg">
    <div class="card-header">
        <h5 class="card-title">Formularz wyszukiwania</h5>
    </div>
    <div class="card-body">

        <form action="{$conf->action_root}searchVolumes" method="post">
            <div class="row form-group">
                {* AUTHOR *}
                <div class="col">
                    <input name="author" type="text" class="form-control" id="inputAuthor" placeholder="Autor" 
                    value="{$searchForm->author}">
                </div>

                {* TITLE *}
                <div class="col">
                    <input name="title" type="text" class="form-control" id="inputTitle" placeholder="Tytuł" 
                    value="{$searchForm->title}">
                </div>

                {* YEAR *}
                <div class="col">
                    <input name="year" type="text" class="form-control" id="inputYear" placeholder="Rok" 
                    value="{$searchForm->year}">
                </div>
            </div>
            <div class="row">
                {* ONLY AVAILABLE CHECKBOX *}
                <div class="col">
                    <div class="form-check form-group">
                        <input name="onlyAvailable" type="checkbox" class="form-check-input">
                        <label class="form-check-label">Pokaż tylko dostępne do wypożyczenia</label>
                    </div>
                </div>
                {* SUBMIT BUTTON *}
                <div class="col-6">
                    <div class="">
                        <button type="submit" class="btn btn-warning btn-block">Wyszukaj</button>
                    </div>
                </div>
            </div>

        </form>

    </div>
</div>
