{extends file="main.tpl"}
{block name=content}

  <!--
  ----- ADD VOLUMES FORM -----
  -->

  <p></p>
  <div class="card shadow-lg">
    <div class="card-body bg-light">
      <h5 class="card-title">Formularz dodawania nowych woluminów do bazy danych</h5>

      <form action='{$conf->action_root}add_volume' method='post'>

        <div class="form-group row">
          <label for="inputAuthor" class="col-sm-2 col-form-label">Autor</label>
          <div class="col-sm-10">
            <input name='author' type="text" class="form-control" id="inputAuthor" placeholder="Autor" 
                   value="{if isset($author)}{$author}{/if}">
          </div>
        </div>

        <div class="form-group row">
          <label for="inputTitle" class="col-sm-2 col-form-label">Tytuł</label>
          <div class="col-sm-10">
            <input name='title' type="text" class="form-control" id="inputTitle" placeholder="Tytuł" 
                   value="{if isset($title)}{$title}{/if}">
          </div>
        </div>

        <div class="form-group row">
          <label for="inputYear" class="col-sm-2 col-form-label">Rok wydania</label>
          <div class="col-sm-10">
            <input name='year' type="text" class="form-control" id="inputYear" placeholder="Rok wydania" 
                   value="{if isset($year)}{$year}{/if}">
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm">
            <button type="submit" class="btn btn-danger btn-block btn-lg">Dodaj wolumin</button>
          </div>
        </div>

      </form>

    </div>
  </div>

{/block}