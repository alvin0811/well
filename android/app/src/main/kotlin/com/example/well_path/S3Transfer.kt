package com.example.well_path

import android.util.Log
import com.amazonaws.mobileconnectors.s3.transferutility.TransferListener
import com.amazonaws.mobileconnectors.s3.transferutility.TransferState
import io.flutter.plugin.common.EventChannel

class S3TransferListener(
    private val events: EventChannel.EventSink?,
    private val onComplete: () -> Unit
) : TransferListener {

    override fun onStateChanged(id: Int, state: TransferState?) {
        Log.d(TAG, "onStateChanged: $state")

        if (state == TransferState.COMPLETED) {
            onComplete.invoke()
        }
    }

    override fun onProgressChanged(id: Int, bytesCurrent: Long, bytesTotal: Long) {
        val percentDoNef = bytesCurrent.toFloat() / bytesTotal.toFloat() * 100
        val percentDone = percentDoNef.toInt()
        Log.d(
            TAG, "ID:$id bytesCurrent: $bytesCurrent bytesTotal: $bytesTotal $percentDone%"
        )
        events?.success(percentDone)
    }

    override fun onError(id: Int, ex: Exception) {
        Log.e(TAG, "onError: $ex")
    }

    companion object {
        private const val TAG = "S3TransferListener"
    }
}