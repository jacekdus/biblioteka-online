<p></p>
<div class="card shadow-lg">
    <div class="card-body bg-light">
        <h5 class="card-title">Najnowsze newsy</h5>
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">

            {foreach $news as $n}
            {if $n eq $news[0]}

                <div class="carousel-item active">

            {else}

                <div class="carousel-item">

            {/if}

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-danger"><u>{$n["title"]}</u></h5>
                            <h6 class="card-subtitle mb-2 text-muted">{$n["date"]}, <b>{$n["login"]}</b></h6>
                            <p class="card-text">{$n["text"]}</p>
                        </div>
                    </div>

                </div>
            {/foreach}

            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>
    </div>
</div>
