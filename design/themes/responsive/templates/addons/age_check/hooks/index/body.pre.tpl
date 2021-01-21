{if $smarty.cookies.accept == "Y"}
{else}
    <div class="cm-dialog-auto-open" style="width: 30%; height:auto;" id="open_id" title="Проверка возраста">
        {if $smarty.cookies.age >= 18}
            <form name="get_accept_form" action="{""|fn_url}" method="post">
                <h1>Вам есть 18 лет. Контент доступен. Нажмите кнопку и это окно больше не появится</h1>
                <div class="buttons-container">
                    {include 
                            file="buttons/button.tpl"
                            but_text=__("continue")
                            but_meta="ty-btn__secondary"
                            but_name="dispatch[age_check.accept]"
                    }
                </div>
            </form>
        {/if}
        {if $smarty.cookies.age < 18 && $smarty.cookies.age}
            <h1>Вам нету 18 лет. Контент не доступен.</h1>
        {/if}
        {if !$smarty.cookies.age}
            <form name="enter_age_form" action="{""|fn_url}" method="post">
                <input type="date" name="age_user"></input>
                <div class="buttons-container">
                    {include 
                            file="buttons/button.tpl"
                            but_text=__("continue")
                            but_meta="ty-btn__secondary"
                            but_name="dispatch[age_check.check]"
                    }
                </div>
            </form>
        {/if}
    </div>
{/if}

<style>
    .ui-dialog-titlebar-close {
        visibility: hidden;
    }
</style>