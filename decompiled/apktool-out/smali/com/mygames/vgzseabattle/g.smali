.class Lcom/mygames/vgzseabattle/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    packed-switch p2, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    const-string v1, "Tap Close menu item to continue the game with current settings."

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    const-string v1, "Tap Show opponent screen item to shoot the opponent ships."

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    const-string v1, "Tap this item to get the game help."

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V

    goto :goto_0

    :pswitch_3
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/g;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->finish()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
