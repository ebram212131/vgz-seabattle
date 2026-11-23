.class Lcom/mygames/vgzseabattle/h;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/h;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    packed-switch p2, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/h;->a:Lcom/mygames/vgzseabattle/ActivityLearnScreen;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->finish()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
