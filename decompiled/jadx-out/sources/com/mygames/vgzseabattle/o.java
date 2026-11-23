package com.mygames.vgzseabattle;

import android.media.MediaPlayer;

/* loaded from: classes.dex */
class o implements MediaPlayer.OnCompletionListener {
    final /* synthetic */ l a;

    o(l lVar) {
        this.a = lVar;
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mediaPlayer) {
        MediaPlayer mediaPlayer2;
        mediaPlayer2 = this.a.a;
        mediaPlayer2.release();
        this.a.c();
    }
}
