.class Lcom/mygames/vgzseabattle/j;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityMenu;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/16 v5, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/mygames/vgzseabattle/x;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/x;-><init>()V

    const-string v1, "data1.txt"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/x;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v3

    iget-object v1, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    const/4 v2, 0x5

    invoke-static {v1, v2}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v1, v4}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v1, v3}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    new-instance v1, Lcom/mygames/vgzseabattle/y;

    invoke-direct {v1}, Lcom/mygames/vgzseabattle/y;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/mygames/vgzseabattle/p;->b:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/mygames/vgzseabattle/y;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v5}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v4, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v5}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    goto :goto_0

    :cond_1
    if-lez v0, :cond_2

    const/16 v1, 0xb

    if-ge v0, v1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/j;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    const/4 v1, 0x7

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    goto :goto_0
.end method
