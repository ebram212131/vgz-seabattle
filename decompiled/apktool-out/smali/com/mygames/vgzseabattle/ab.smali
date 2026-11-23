.class Lcom/mygames/vgzseabattle/ab;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/RegisterApp;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/RegisterApp;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/ab;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ab;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Lcom/mygames/vgzseabattle/RegisterApp;)I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ab;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/RegisterApp;->b(Lcom/mygames/vgzseabattle/RegisterApp;)V

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ab;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/RegisterApp;->c(Lcom/mygames/vgzseabattle/RegisterApp;)I

    move-result v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ab;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/RegisterApp;->d(Lcom/mygames/vgzseabattle/RegisterApp;)V

    :cond_1
    return-void
.end method
