.class Lcom/mygames/vgzseabattle/r;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/MainActivity;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->k(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    if-ne v0, v1, :cond_0

    new-instance v0, Lcom/mygames/vgzseabattle/x;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/x;-><init>()V

    const-string v1, "data1.txt"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/x;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    :goto_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->h:Z

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->m(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->n(Lcom/mygames/vgzseabattle/MainActivity;)V

    :cond_1
    return-void

    :cond_2
    iget-object v1, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->l(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mygames/vgzseabattle/r;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v2, v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
