.class Lcom/mygames/vgzseabattle/t;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/MainActivity;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v5, 0x0

    new-instance v0, Lcom/mygames/vgzseabattle/y;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/y;-><init>()V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v2}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/mygames/vgzseabattle/y;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1000*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1000*"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/mygames/vgzseabattle/aa;

    invoke-direct {v1}, Lcom/mygames/vgzseabattle/aa;-><init>()V

    iget-object v2, p0, Lcom/mygames/vgzseabattle/t;->a:Lcom/mygames/vgzseabattle/MainActivity;

    aget-object v3, v0, v5

    const/4 v4, 0x1

    aget-object v0, v0, v4

    invoke-virtual {v1, v5, v3, v0}, Lcom/mygames/vgzseabattle/aa;->a(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    goto :goto_0
.end method
