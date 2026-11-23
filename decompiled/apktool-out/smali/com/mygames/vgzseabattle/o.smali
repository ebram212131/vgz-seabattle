.class Lcom/mygames/vgzseabattle/o;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/l;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/l;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/o;->a:Lcom/mygames/vgzseabattle/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/o;->a:Lcom/mygames/vgzseabattle/l;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/l;->a(Lcom/mygames/vgzseabattle/l;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/o;->a:Lcom/mygames/vgzseabattle/l;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/l;->b(Lcom/mygames/vgzseabattle/l;)V

    return-void
.end method
