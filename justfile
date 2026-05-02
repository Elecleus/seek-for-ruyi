default: test-jade test-handle

test-jade:
    cd ./ruyi-jade-k && just test-export

test-handle:
    cd ./ruyi-handle-rs && just
