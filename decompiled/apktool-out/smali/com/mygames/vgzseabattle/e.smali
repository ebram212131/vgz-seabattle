.class Lcom/mygames/vgzseabattle/e;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityGameScreen;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    const/4 v1, 0x0

    packed-switch p2, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Lcom/mygames/vgzseabattle/ActivityGameScreen;I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(Lcom/mygames/vgzseabattle/ActivityGameScreen;I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/e;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
