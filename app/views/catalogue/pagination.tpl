<nav aria-label="Page navigation">
  {* <div class="d-flex justify-content-center"> *}
  {* PAGE BOX *}
  <ul class="pagination float-left mr-3">
    <li class="page-item disabled"><a class="page-link">Strona <b>{$pageNumber}/{$pages}</b></a></li>
  </ul>

  {* VOLUMES NUMBER BOX *}
  <ul class="pagination float-left mr-3">
    <li class="page-item disabled"><a class="page-link"><b>{$amount}</b> woluminów</a></li>
  </ul>

  {* PAGINATION BOX *}
  <ul class="pagination">
    {* go to first page BUTTON *}
    <li class="page-item {if $pageNumber eq 1}disabled{/if}">
      <button class="page-link" name="paginationButton" value="1">
        <span aria-hidden="true">&laquo;</span>
      </button>
    </li>

    {* go to page n,n+1,n+2 BUTTONS *}
    {if $pageNumber - 1  > 0}
    <li class="page-item"><button class="page-link" name="paginationButton" value="{$pageNumber - 1}">{$pageNumber - 1}</button></li>{/if}

    <li class="page-item active"><button class="page-link">{$pageNumber}</button></li>

    {* current(active) page *}
    {if $pageNumber + 1 <= $pages}
    <li class="page-item"><button class="page-link" name="paginationButton" value="{$pageNumber + 1}">{$pageNumber + 1}</button></li>{/if} 

    {* go to Last page BUTTON *}
    <li class="page-item {if $pageNumber eq $pages}disabled{/if}">
      <button class="page-link" name="paginationButton" value="{$pages}">
        <span aria-hidden="true">&raquo;</span>
      </button>
    </li>

  </ul>
  {* </div> *}
</nav>