; ModuleID = 'automotive_bitcount.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfile = type { ptr, i8, i8, i8, i8 }

@bits = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits.1 = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@.str = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"%-38s> Bits: %ld\0A\00", align 1
@.str.10 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1.11 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2.12 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3.13 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) uwtable
define dso_local noalias noundef ptr @alloc_bit_array(i64 noundef %arg) local_unnamed_addr #0 {
bb:
  %i = add i64 %arg, 7
  %i1 = lshr i64 %i, 3
  %i2 = tail call noalias ptr @calloc(i64 noundef %i1, i64 noundef 1) #19
  ret ptr %i2
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @getbit(ptr nocapture noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i4 = load i8, ptr %i3, align 1, !tbaa !8
  %i5 = sext i8 %i4 to i32
  %i6 = and i32 %arg1, 7
  %i7 = lshr i32 %i5, %i6
  %i8 = and i32 %i7, 1
  ret i32 %i8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @setbit(ptr nocapture noundef %arg, i32 noundef %arg1, i32 noundef %arg2) local_unnamed_addr #3 {
bb:
  %i = sdiv i32 %arg1, 8
  %i3 = sext i32 %i to i64
  %i4 = getelementptr inbounds i8, ptr %arg, i64 %i3
  %i5 = icmp eq i32 %arg2, 0
  %i6 = and i32 %arg1, 7
  %i7 = shl nuw nsw i32 1, %i6
  %i8 = load i8, ptr %i4, align 1, !tbaa !8
  %i9 = trunc i32 %i7 to i8
  %i10 = xor i8 %i9, -1
  %i11 = and i8 %i8, %i10
  %i12 = or i8 %i8, %i9
  %i13 = select i1 %i5, i8 %i11, i8 %i12
  store i8 %i13, ptr %i4, align 1, !tbaa !8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @flipbit(ptr nocapture noundef %arg, i32 noundef %arg1) local_unnamed_addr #3 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i4 = and i32 %arg1, 7
  %i5 = shl nuw nsw i32 1, %i4
  %i6 = load i8, ptr %i3, align 1, !tbaa !8
  %i7 = trunc i32 %i5 to i8
  %i8 = xor i8 %i6, %i7
  store i8 %i8, ptr %i3, align 1, !tbaa !8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @bit_count(i64 noundef %arg) local_unnamed_addr #4 {
bb:
  %i = icmp eq i64 %arg, 0
  br i1 %i, label %bb.bb8_crit_edge, label %bb1.preheader

bb.bb8_crit_edge:                                 ; preds = %bb
  br label %bb8

bb1.preheader:                                    ; preds = %bb
  br label %bb1

bb1:                                              ; preds = %bb1.bb1_crit_edge, %bb1.preheader
  %i2 = phi i64 [ %i6, %bb1.bb1_crit_edge ], [ %arg, %bb1.preheader ]
  %i3 = phi i32 [ %i4, %bb1.bb1_crit_edge ], [ 0, %bb1.preheader ]
  %i4 = add nuw nsw i32 %i3, 1
  %i5 = add nsw i64 %i2, -1
  %i6 = and i64 %i5, %i2
  %i7 = icmp eq i64 %i6, 0
  br i1 %i7, label %bb8.loopexit, label %bb1.bb1_crit_edge, !llvm.loop !11

bb1.bb1_crit_edge:                                ; preds = %bb1
  br label %bb1

bb8.loopexit:                                     ; preds = %bb1
  br label %bb8

bb8:                                              ; preds = %bb.bb8_crit_edge, %bb8.loopexit
  %i9 = phi i32 [ 0, %bb.bb8_crit_edge ], [ %i4, %bb8.loopexit ]
  ret i32 %i9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @bitcount(i64 noundef %arg) local_unnamed_addr #5 {
bb:
  %i = lshr i64 %arg, 1
  %i1 = and i64 %i, 1431655765
  %i2 = and i64 %arg, 1431655765
  %i3 = add nuw nsw i64 %i1, %i2
  %i4 = lshr i64 %i3, 2
  %i5 = and i64 %i4, 858993459
  %i6 = and i64 %i3, 858993459
  %i7 = add nuw nsw i64 %i5, %i6
  %i8 = lshr i64 %i7, 4
  %i9 = and i64 %i8, 117901063
  %i10 = and i64 %i7, 117901063
  %i11 = add nuw nsw i64 %i9, %i10
  %i12 = lshr i64 %i11, 8
  %i13 = and i64 %i12, 983055
  %i14 = and i64 %i11, 983055
  %i15 = add nuw nsw i64 %i13, %i14
  %i16 = lshr i64 %i15, 16
  %i17 = and i64 %i15, 31
  %i18 = add nuw nsw i64 %i16, %i17
  %i19 = trunc i64 %i18 to i32
  ret i32 %i19
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @ntbl_bitcount(i64 noundef %arg) local_unnamed_addr #5 {
bb:
  %i = and i64 %arg, 15
  %i1 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i
  %i2 = load i8, ptr %i1, align 1, !tbaa !8
  %i3 = sext i8 %i2 to i32
  %i4 = lshr i64 %arg, 4
  %i5 = and i64 %i4, 15
  %i6 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i5
  %i7 = load i8, ptr %i6, align 1, !tbaa !8
  %i8 = sext i8 %i7 to i32
  %i9 = add nsw i32 %i8, %i3
  %i10 = lshr i64 %arg, 8
  %i11 = and i64 %i10, 15
  %i12 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i11
  %i13 = load i8, ptr %i12, align 1, !tbaa !8
  %i14 = sext i8 %i13 to i32
  %i15 = add nsw i32 %i9, %i14
  %i16 = lshr i64 %arg, 12
  %i17 = and i64 %i16, 15
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !8
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i15, %i20
  %i22 = lshr i64 %arg, 16
  %i23 = and i64 %i22, 15
  %i24 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i23
  %i25 = load i8, ptr %i24, align 1, !tbaa !8
  %i26 = sext i8 %i25 to i32
  %i27 = add nsw i32 %i21, %i26
  %i28 = lshr i64 %arg, 20
  %i29 = and i64 %i28, 15
  %i30 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i29
  %i31 = load i8, ptr %i30, align 1, !tbaa !8
  %i32 = sext i8 %i31 to i32
  %i33 = add nsw i32 %i27, %i32
  %i34 = lshr i64 %arg, 24
  %i35 = and i64 %i34, 15
  %i36 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i35
  %i37 = load i8, ptr %i36, align 1, !tbaa !8
  %i38 = sext i8 %i37 to i32
  %i39 = add nsw i32 %i33, %i38
  %i40 = lshr i64 %arg, 28
  %i41 = and i64 %i40, 15
  %i42 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i41
  %i43 = load i8, ptr %i42, align 1, !tbaa !8
  %i44 = sext i8 %i43 to i32
  %i45 = add nsw i32 %i39, %i44
  ret i32 %i45
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @BW_btbl_bitcount(i64 noundef %arg) local_unnamed_addr #5 {
bb:
  %i = lshr i64 %arg, 8
  %i1 = lshr i64 %arg, 16
  %i2 = lshr i64 %arg, 24
  %i3 = and i64 %arg, 255
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1, !tbaa !8
  %i6 = sext i8 %i5 to i32
  %i7 = and i64 %i, 255
  %i8 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i7
  %i9 = load i8, ptr %i8, align 1, !tbaa !8
  %i10 = sext i8 %i9 to i32
  %i11 = add nsw i32 %i10, %i6
  %i12 = and i64 %i2, 255
  %i13 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i12
  %i14 = load i8, ptr %i13, align 1, !tbaa !8
  %i15 = sext i8 %i14 to i32
  %i16 = add nsw i32 %i11, %i15
  %i17 = and i64 %i1, 255
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !8
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i16, %i20
  ret i32 %i21
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @AR_btbl_bitcount(i64 noundef %arg) local_unnamed_addr #5 {
bb:
  %i = lshr i64 %arg, 8
  %i1 = lshr i64 %arg, 16
  %i2 = lshr i64 %arg, 24
  %i3 = and i64 %arg, 255
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1, !tbaa !8
  %i6 = sext i8 %i5 to i32
  %i7 = and i64 %i, 255
  %i8 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i7
  %i9 = load i8, ptr %i8, align 1, !tbaa !8
  %i10 = sext i8 %i9 to i32
  %i11 = add nsw i32 %i10, %i6
  %i12 = and i64 %i1, 255
  %i13 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i12
  %i14 = load i8, ptr %i13, align 1, !tbaa !8
  %i15 = sext i8 %i14 to i32
  %i16 = add nsw i32 %i11, %i15
  %i17 = and i64 %i2, 255
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !8
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i16, %i20
  ret i32 %i21
}

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @ntbl_bitcnt(i64 noundef %arg) local_unnamed_addr #4 {
bb:
  %i = and i64 %arg, 15
  %i1 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i
  %i2 = load i8, ptr %i1, align 1, !tbaa !8
  %i3 = sext i8 %i2 to i32
  %i4 = icmp ult i64 %arg, 16
  br i1 %i4, label %bb.bb16_crit_edge, label %bb5.preheader

bb.bb16_crit_edge:                                ; preds = %bb
  br label %bb16

bb5.preheader:                                    ; preds = %bb
  br label %bb5

bb5:                                              ; preds = %bb5.bb5_crit_edge, %bb5.preheader
  %i6 = phi i32 [ %i14, %bb5.bb5_crit_edge ], [ %i3, %bb5.preheader ]
  %i7 = phi i64 [ %i9, %bb5.bb5_crit_edge ], [ %arg, %bb5.preheader ]
  %i8 = phi i32 [ %i10, %bb5.bb5_crit_edge ], [ 0, %bb5.preheader ]
  %i9 = ashr i64 %i7, 4
  %i10 = add nsw i32 %i6, %i8
  %i11 = and i64 %i9, 15
  %i12 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i11
  %i13 = load i8, ptr %i12, align 1, !tbaa !8
  %i14 = sext i8 %i13 to i32
  %i15 = icmp ult i64 %i9, 16
  br i1 %i15, label %bb16.loopexit, label %bb5.bb5_crit_edge

bb5.bb5_crit_edge:                                ; preds = %bb5
  br label %bb5

bb16.loopexit:                                    ; preds = %bb5
  br label %bb16

bb16:                                             ; preds = %bb.bb16_crit_edge, %bb16.loopexit
  %i17 = phi i32 [ 0, %bb.bb16_crit_edge ], [ %i10, %bb16.loopexit ]
  %i18 = phi i32 [ %i3, %bb.bb16_crit_edge ], [ %i14, %bb16.loopexit ]
  %i19 = add nsw i32 %i18, %i17
  ret i32 %i19
}

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %arg) local_unnamed_addr #4 {
bb:
  %i = and i64 %arg, 255
  %i1 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i
  %i2 = load i8, ptr %i1, align 1, !tbaa !8
  %i3 = sext i8 %i2 to i32
  %i4 = icmp ult i64 %arg, 256
  br i1 %i4, label %bb.bb16_crit_edge, label %bb5.preheader

bb.bb16_crit_edge:                                ; preds = %bb
  br label %bb16

bb5.preheader:                                    ; preds = %bb
  br label %bb5

bb5:                                              ; preds = %bb5.bb5_crit_edge, %bb5.preheader
  %i6 = phi i32 [ %i14, %bb5.bb5_crit_edge ], [ %i3, %bb5.preheader ]
  %i7 = phi i64 [ %i9, %bb5.bb5_crit_edge ], [ %arg, %bb5.preheader ]
  %i8 = phi i32 [ %i10, %bb5.bb5_crit_edge ], [ 0, %bb5.preheader ]
  %i9 = ashr i64 %i7, 8
  %i10 = add nsw i32 %i6, %i8
  %i11 = and i64 %i9, 255
  %i12 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i11
  %i13 = load i8, ptr %i12, align 1, !tbaa !8
  %i14 = sext i8 %i13 to i32
  %i15 = icmp ult i64 %i9, 256
  br i1 %i15, label %bb16.loopexit, label %bb5.bb5_crit_edge

bb5.bb5_crit_edge:                                ; preds = %bb5
  br label %bb5

bb16.loopexit:                                    ; preds = %bb5
  br label %bb16

bb16:                                             ; preds = %bb.bb16_crit_edge, %bb16.loopexit
  %i17 = phi i32 [ 0, %bb.bb16_crit_edge ], [ %i10, %bb16.loopexit ]
  %i18 = phi i32 [ %i3, %bb.bb16_crit_edge ], [ %i14, %bb16.loopexit ]
  %i19 = add nsw i32 %i18, %i17
  ret i32 %i19
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #6 {
bb:
  %i = icmp slt i32 %arg, 2
  br i1 %i, label %bb3, label %bb6

bb3:                                              ; preds = %bb
  %i4 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i5 = tail call i64 @fwrite(ptr nonnull @.str.7, i64 28, i64 1, ptr %i4) #20
  tail call void @exit(i32 noundef 1) #21
  unreachable

bb6:                                              ; preds = %bb
  %i7 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i8 = load ptr, ptr %i7, align 8, !tbaa !13
  %i9 = tail call i64 @strtol(ptr nocapture noundef nonnull %i8, ptr noundef null, i32 noundef 10) #22
  %i10 = icmp eq i32 %arg2, 0
  br i1 %i10, label %bb6.bb13_crit_edge, label %bb11

bb6.bb13_crit_edge:                               ; preds = %bb6
  br label %bb13

bb11:                                             ; preds = %bb6
  %i12 = tail call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.8)
  br label %bb13

bb13:                                             ; preds = %bb6.bb13_crit_edge, %bb11
  %i14 = shl i64 %i9, 32
  %i15 = ashr exact i64 %i14, 32
  %i16 = icmp sgt i64 %i15, 0
  br i1 %i16, label %bb17.preheader, label %bb13.bb27_crit_edge

bb13.bb27_crit_edge:                              ; preds = %bb13
  br label %bb27

bb17.preheader:                                   ; preds = %bb13
  br label %bb17

bb17:                                             ; preds = %bb17.bb17_crit_edge, %bb17.preheader
  %i18 = phi i64 [ %i25, %bb17.bb17_crit_edge ], [ 1, %bb17.preheader ]
  %i19 = phi i64 [ %i23, %bb17.bb17_crit_edge ], [ 0, %bb17.preheader ]
  %i20 = phi i64 [ %i24, %bb17.bb17_crit_edge ], [ 0, %bb17.preheader ]
  %i21 = tail call i32 @bit_count(i64 noundef %i18) #22
  %i22 = sext i32 %i21 to i64
  %i23 = add nsw i64 %i19, %i22
  %i24 = add nuw nsw i64 %i20, 1
  %i25 = add nuw nsw i64 %i18, 13
  %i26 = icmp eq i64 %i24, %i15
  br i1 %i26, label %bb27.loopexit, label %bb17.bb17_crit_edge, !llvm.loop !15

bb17.bb17_crit_edge:                              ; preds = %bb17
  br label %bb17

bb27.loopexit:                                    ; preds = %bb17
  br label %bb27

bb27:                                             ; preds = %bb13.bb27_crit_edge, %bb27.loopexit
  %i28 = phi i64 [ 0, %bb13.bb27_crit_edge ], [ %i23, %bb27.loopexit ]
  br i1 %i10, label %bb27.bb31_crit_edge, label %bb29

bb27.bb31_crit_edge:                              ; preds = %bb27
  br label %bb31

bb29:                                             ; preds = %bb27
  %i30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str, i64 noundef %i28)
  br label %bb31

bb31:                                             ; preds = %bb27.bb31_crit_edge, %bb29
  br i1 %i16, label %bb32.preheader, label %bb31.bb42_crit_edge

bb31.bb42_crit_edge:                              ; preds = %bb31
  br label %bb42

bb32.preheader:                                   ; preds = %bb31
  br label %bb32

bb32:                                             ; preds = %bb32.bb32_crit_edge, %bb32.preheader
  %i33 = phi i64 [ %i40, %bb32.bb32_crit_edge ], [ 1, %bb32.preheader ]
  %i34 = phi i64 [ %i38, %bb32.bb32_crit_edge ], [ 0, %bb32.preheader ]
  %i35 = phi i64 [ %i39, %bb32.bb32_crit_edge ], [ 0, %bb32.preheader ]
  %i36 = tail call i32 @bitcount(i64 noundef %i33) #22
  %i37 = sext i32 %i36 to i64
  %i38 = add nsw i64 %i34, %i37
  %i39 = add nuw nsw i64 %i35, 1
  %i40 = add nuw nsw i64 %i33, 13
  %i41 = icmp eq i64 %i39, %i15
  br i1 %i41, label %bb42.loopexit, label %bb32.bb32_crit_edge, !llvm.loop !15

bb32.bb32_crit_edge:                              ; preds = %bb32
  br label %bb32

bb42.loopexit:                                    ; preds = %bb32
  br label %bb42

bb42:                                             ; preds = %bb31.bb42_crit_edge, %bb42.loopexit
  %i43 = phi i64 [ 0, %bb31.bb42_crit_edge ], [ %i38, %bb42.loopexit ]
  br i1 %i10, label %bb42.bb46_crit_edge, label %bb44

bb42.bb46_crit_edge:                              ; preds = %bb42
  br label %bb46

bb44:                                             ; preds = %bb42
  %i45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.1, i64 noundef %i43)
  br label %bb46

bb46:                                             ; preds = %bb42.bb46_crit_edge, %bb44
  br i1 %i16, label %bb47.preheader, label %bb46.bb57_crit_edge

bb46.bb57_crit_edge:                              ; preds = %bb46
  br label %bb57

bb47.preheader:                                   ; preds = %bb46
  br label %bb47

bb47:                                             ; preds = %bb47.bb47_crit_edge, %bb47.preheader
  %i48 = phi i64 [ %i55, %bb47.bb47_crit_edge ], [ 1, %bb47.preheader ]
  %i49 = phi i64 [ %i53, %bb47.bb47_crit_edge ], [ 0, %bb47.preheader ]
  %i50 = phi i64 [ %i54, %bb47.bb47_crit_edge ], [ 0, %bb47.preheader ]
  %i51 = tail call i32 @ntbl_bitcnt(i64 noundef %i48) #22
  %i52 = sext i32 %i51 to i64
  %i53 = add nsw i64 %i49, %i52
  %i54 = add nuw nsw i64 %i50, 1
  %i55 = add nuw nsw i64 %i48, 13
  %i56 = icmp eq i64 %i54, %i15
  br i1 %i56, label %bb57.loopexit, label %bb47.bb47_crit_edge, !llvm.loop !15

bb47.bb47_crit_edge:                              ; preds = %bb47
  br label %bb47

bb57.loopexit:                                    ; preds = %bb47
  br label %bb57

bb57:                                             ; preds = %bb46.bb57_crit_edge, %bb57.loopexit
  %i58 = phi i64 [ 0, %bb46.bb57_crit_edge ], [ %i53, %bb57.loopexit ]
  br i1 %i10, label %bb57.bb61_crit_edge, label %bb59

bb57.bb61_crit_edge:                              ; preds = %bb57
  br label %bb61

bb59:                                             ; preds = %bb57
  %i60 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.2, i64 noundef %i58)
  br label %bb61

bb61:                                             ; preds = %bb57.bb61_crit_edge, %bb59
  br i1 %i16, label %bb62.preheader, label %bb61.bb72_crit_edge

bb61.bb72_crit_edge:                              ; preds = %bb61
  br label %bb72

bb62.preheader:                                   ; preds = %bb61
  br label %bb62

bb62:                                             ; preds = %bb62.bb62_crit_edge, %bb62.preheader
  %i63 = phi i64 [ %i70, %bb62.bb62_crit_edge ], [ 1, %bb62.preheader ]
  %i64 = phi i64 [ %i68, %bb62.bb62_crit_edge ], [ 0, %bb62.preheader ]
  %i65 = phi i64 [ %i69, %bb62.bb62_crit_edge ], [ 0, %bb62.preheader ]
  %i66 = tail call i32 @ntbl_bitcount(i64 noundef %i63) #22
  %i67 = sext i32 %i66 to i64
  %i68 = add nsw i64 %i64, %i67
  %i69 = add nuw nsw i64 %i65, 1
  %i70 = add nuw nsw i64 %i63, 13
  %i71 = icmp eq i64 %i69, %i15
  br i1 %i71, label %bb72.loopexit, label %bb62.bb62_crit_edge, !llvm.loop !15

bb62.bb62_crit_edge:                              ; preds = %bb62
  br label %bb62

bb72.loopexit:                                    ; preds = %bb62
  br label %bb72

bb72:                                             ; preds = %bb61.bb72_crit_edge, %bb72.loopexit
  %i73 = phi i64 [ 0, %bb61.bb72_crit_edge ], [ %i68, %bb72.loopexit ]
  br i1 %i10, label %bb72.bb76_crit_edge, label %bb74

bb72.bb76_crit_edge:                              ; preds = %bb72
  br label %bb76

bb74:                                             ; preds = %bb72
  %i75 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.3, i64 noundef %i73)
  br label %bb76

bb76:                                             ; preds = %bb72.bb76_crit_edge, %bb74
  br i1 %i16, label %bb77.preheader, label %bb76.bb87_crit_edge

bb76.bb87_crit_edge:                              ; preds = %bb76
  br label %bb87

bb77.preheader:                                   ; preds = %bb76
  br label %bb77

bb77:                                             ; preds = %bb77.bb77_crit_edge, %bb77.preheader
  %i78 = phi i64 [ %i85, %bb77.bb77_crit_edge ], [ 1, %bb77.preheader ]
  %i79 = phi i64 [ %i83, %bb77.bb77_crit_edge ], [ 0, %bb77.preheader ]
  %i80 = phi i64 [ %i84, %bb77.bb77_crit_edge ], [ 0, %bb77.preheader ]
  %i81 = tail call i32 @BW_btbl_bitcount(i64 noundef %i78) #22
  %i82 = sext i32 %i81 to i64
  %i83 = add nsw i64 %i79, %i82
  %i84 = add nuw nsw i64 %i80, 1
  %i85 = add nuw nsw i64 %i78, 13
  %i86 = icmp eq i64 %i84, %i15
  br i1 %i86, label %bb87.loopexit, label %bb77.bb77_crit_edge, !llvm.loop !15

bb77.bb77_crit_edge:                              ; preds = %bb77
  br label %bb77

bb87.loopexit:                                    ; preds = %bb77
  br label %bb87

bb87:                                             ; preds = %bb76.bb87_crit_edge, %bb87.loopexit
  %i88 = phi i64 [ 0, %bb76.bb87_crit_edge ], [ %i83, %bb87.loopexit ]
  br i1 %i10, label %bb87.bb91_crit_edge, label %bb89

bb87.bb91_crit_edge:                              ; preds = %bb87
  br label %bb91

bb89:                                             ; preds = %bb87
  %i90 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.4, i64 noundef %i88)
  br label %bb91

bb91:                                             ; preds = %bb87.bb91_crit_edge, %bb89
  br i1 %i16, label %bb92.preheader, label %bb91.bb102_crit_edge

bb91.bb102_crit_edge:                             ; preds = %bb91
  br label %bb102

bb92.preheader:                                   ; preds = %bb91
  br label %bb92

bb92:                                             ; preds = %bb92.bb92_crit_edge, %bb92.preheader
  %i93 = phi i64 [ %i100, %bb92.bb92_crit_edge ], [ 1, %bb92.preheader ]
  %i94 = phi i64 [ %i98, %bb92.bb92_crit_edge ], [ 0, %bb92.preheader ]
  %i95 = phi i64 [ %i99, %bb92.bb92_crit_edge ], [ 0, %bb92.preheader ]
  %i96 = tail call i32 @AR_btbl_bitcount(i64 noundef %i93) #22
  %i97 = sext i32 %i96 to i64
  %i98 = add nsw i64 %i94, %i97
  %i99 = add nuw nsw i64 %i95, 1
  %i100 = add nuw nsw i64 %i93, 13
  %i101 = icmp eq i64 %i99, %i15
  br i1 %i101, label %bb102.loopexit, label %bb92.bb92_crit_edge, !llvm.loop !15

bb92.bb92_crit_edge:                              ; preds = %bb92
  br label %bb92

bb102.loopexit:                                   ; preds = %bb92
  br label %bb102

bb102:                                            ; preds = %bb91.bb102_crit_edge, %bb102.loopexit
  %i103 = phi i64 [ 0, %bb91.bb102_crit_edge ], [ %i98, %bb102.loopexit ]
  br i1 %i10, label %bb102.bb106_crit_edge, label %bb104

bb102.bb106_crit_edge:                            ; preds = %bb102
  br label %bb106

bb104:                                            ; preds = %bb102
  %i105 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.5, i64 noundef %i103)
  br label %bb106

bb106:                                            ; preds = %bb102.bb106_crit_edge, %bb104
  br i1 %i16, label %bb107, label %bb106.bb170_crit_edge

bb106.bb170_crit_edge:                            ; preds = %bb106
  br label %bb170

bb107:                                            ; preds = %bb106
  %i108 = and i64 %i9, 1
  %i109 = icmp eq i64 %i14, 4294967296
  br i1 %i109, label %bb107.bb150_crit_edge, label %bb110

bb107.bb150_crit_edge:                            ; preds = %bb107
  br label %bb150

bb110:                                            ; preds = %bb107
  %i111 = sub nsw i64 %i15, %i108
  br label %bb112

bb112:                                            ; preds = %bb144.bb112_crit_edge, %bb110
  %i113 = phi i64 [ 1, %bb110 ], [ %i147, %bb144.bb112_crit_edge ]
  %i114 = phi i64 [ 0, %bb110 ], [ %i146, %bb144.bb112_crit_edge ]
  %i115 = phi i64 [ 0, %bb110 ], [ %i148, %bb144.bb112_crit_edge ]
  br label %bb116

bb116:                                            ; preds = %bb116.bb116_crit_edge, %bb112
  %i117 = phi i32 [ %i122, %bb116.bb116_crit_edge ], [ 0, %bb112 ]
  %i118 = phi i32 [ %i123, %bb116.bb116_crit_edge ], [ 0, %bb112 ]
  %i119 = phi i64 [ %i124, %bb116.bb116_crit_edge ], [ %i113, %bb112 ]
  %i120 = trunc i64 %i119 to i32
  %i121 = and i32 %i120, 1
  %i122 = add nuw nsw i32 %i121, %i117
  %i123 = add nuw nsw i32 %i118, 1
  %i124 = lshr i64 %i119, 1
  %i125 = icmp ugt i64 %i119, 1
  %i126 = icmp ult i32 %i118, 63
  %i127 = select i1 %i125, i1 %i126, i1 false
  br i1 %i127, label %bb116.bb116_crit_edge, label %bb128, !llvm.loop !16

bb116.bb116_crit_edge:                            ; preds = %bb116
  br label %bb116

bb128:                                            ; preds = %bb116
  %i129 = zext nneg i32 %i122 to i64
  %i130 = add nuw nsw i64 %i114, %i129
  %i131 = add nuw nsw i64 %i113, 13
  br label %bb132

bb132:                                            ; preds = %bb132.bb132_crit_edge, %bb128
  %i133 = phi i32 [ %i138, %bb132.bb132_crit_edge ], [ 0, %bb128 ]
  %i134 = phi i32 [ %i139, %bb132.bb132_crit_edge ], [ 0, %bb128 ]
  %i135 = phi i64 [ %i140, %bb132.bb132_crit_edge ], [ %i131, %bb128 ]
  %i136 = trunc i64 %i135 to i32
  %i137 = and i32 %i136, 1
  %i138 = add nuw nsw i32 %i137, %i133
  %i139 = add nuw nsw i32 %i134, 1
  %i140 = lshr i64 %i135, 1
  %i141 = icmp ugt i64 %i135, 1
  %i142 = icmp ult i32 %i134, 63
  %i143 = select i1 %i141, i1 %i142, i1 false
  br i1 %i143, label %bb132.bb132_crit_edge, label %bb144, !llvm.loop !16

bb132.bb132_crit_edge:                            ; preds = %bb132
  br label %bb132

bb144:                                            ; preds = %bb132
  %i145 = zext nneg i32 %i138 to i64
  %i146 = add nuw nsw i64 %i130, %i145
  %i147 = add nuw nsw i64 %i113, 26
  %i148 = add i64 %i115, 2
  %i149 = icmp eq i64 %i148, %i111
  br i1 %i149, label %bb150.loopexit, label %bb144.bb112_crit_edge, !llvm.loop !15

bb144.bb112_crit_edge:                            ; preds = %bb144
  br label %bb112

bb150.loopexit:                                   ; preds = %bb144
  br label %bb150

bb150:                                            ; preds = %bb107.bb150_crit_edge, %bb150.loopexit
  %i151 = phi i64 [ undef, %bb107.bb150_crit_edge ], [ %i146, %bb150.loopexit ]
  %i152 = phi i64 [ 1, %bb107.bb150_crit_edge ], [ %i147, %bb150.loopexit ]
  %i153 = phi i64 [ 0, %bb107.bb150_crit_edge ], [ %i146, %bb150.loopexit ]
  %i154 = icmp eq i64 %i108, 0
  br i1 %i154, label %bb150.bb170_crit_edge, label %bb155.preheader

bb150.bb170_crit_edge:                            ; preds = %bb150
  br label %bb170

bb155.preheader:                                  ; preds = %bb150
  br label %bb155

bb155:                                            ; preds = %bb155.bb155_crit_edge, %bb155.preheader
  %i156 = phi i32 [ %i161, %bb155.bb155_crit_edge ], [ 0, %bb155.preheader ]
  %i157 = phi i32 [ %i162, %bb155.bb155_crit_edge ], [ 0, %bb155.preheader ]
  %i158 = phi i64 [ %i163, %bb155.bb155_crit_edge ], [ %i152, %bb155.preheader ]
  %i159 = trunc i64 %i158 to i32
  %i160 = and i32 %i159, 1
  %i161 = add nuw nsw i32 %i160, %i156
  %i162 = add nuw nsw i32 %i157, 1
  %i163 = lshr i64 %i158, 1
  %i164 = icmp ugt i64 %i158, 1
  %i165 = icmp ult i32 %i157, 63
  %i166 = select i1 %i164, i1 %i165, i1 false
  br i1 %i166, label %bb155.bb155_crit_edge, label %bb167, !llvm.loop !16

bb155.bb155_crit_edge:                            ; preds = %bb155
  br label %bb155

bb167:                                            ; preds = %bb155
  %i168 = zext nneg i32 %i161 to i64
  %i169 = add nuw nsw i64 %i153, %i168
  br label %bb170

bb170:                                            ; preds = %bb150.bb170_crit_edge, %bb106.bb170_crit_edge, %bb167
  %i171 = phi i64 [ 0, %bb106.bb170_crit_edge ], [ %i151, %bb150.bb170_crit_edge ], [ %i169, %bb167 ]
  br i1 %i10, label %bb170.bb174_crit_edge, label %bb172

bb170.bb174_crit_edge:                            ; preds = %bb170
  br label %bb174

bb172:                                            ; preds = %bb170
  %i173 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.6, i64 noundef %i171)
  br label %bb174

bb174:                                            ; preds = %bb170.bb174_crit_edge, %bb172
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local noalias noundef ptr @bfopen(ptr nocapture noundef readonly %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #6 {
bb:
  %i = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #23
  %i2 = icmp eq ptr %i, null
  br i1 %i2, label %bb.bb10_crit_edge, label %bb3

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb3:                                              ; preds = %bb
  %i4 = tail call noalias ptr @fopen(ptr noundef %arg, ptr noundef %arg1)
  store ptr %i4, ptr %i, align 8, !tbaa !17
  %i5 = icmp eq ptr %i4, null
  br i1 %i5, label %bb6, label %bb7

bb6:                                              ; preds = %bb3
  tail call void @free(ptr noundef nonnull %i) #22
  br label %bb10

bb7:                                              ; preds = %bb3
  %i8 = getelementptr inbounds %struct.bfile, ptr %i, i64 0, i32 2
  store i8 0, ptr %i8, align 1, !tbaa !19
  %i9 = getelementptr inbounds %struct.bfile, ptr %i, i64 0, i32 4
  store i8 0, ptr %i9, align 1, !tbaa !20
  br label %bb10

bb10:                                             ; preds = %bb.bb10_crit_edge, %bb7, %bb6
  %i11 = phi ptr [ null, %bb6 ], [ %i, %bb7 ], [ null, %bb.bb10_crit_edge ]
  ret ptr %i11
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #10

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @bfread(ptr nocapture noundef %arg) local_unnamed_addr #13 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 2
  %i1 = load i8, ptr %i, align 1, !tbaa !19
  %i2 = icmp eq i8 %i1, 0
  br i1 %i2, label %bb7, label %bb3

bb3:                                              ; preds = %bb
  %i4 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 1
  %i5 = load i8, ptr %i4, align 8, !tbaa !21
  %i6 = add i8 %i1, -1
  br label %bb12

bb7:                                              ; preds = %bb
  %i8 = load ptr, ptr %arg, align 8, !tbaa !17
  %i9 = tail call i32 @fgetc(ptr noundef %i8)
  %i10 = trunc i32 %i9 to i8
  %i11 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 1
  store i8 %i10, ptr %i11, align 8, !tbaa !21
  br label %bb12

bb12:                                             ; preds = %bb7, %bb3
  %i13 = phi i8 [ %i10, %bb7 ], [ %i5, %bb3 ]
  %i14 = phi i8 [ 7, %bb7 ], [ %i6, %bb3 ]
  store i8 %i14, ptr %i, align 1, !tbaa !19
  %i15 = sext i8 %i13 to i32
  %i16 = zext nneg i8 %i14 to i32
  %i17 = lshr i32 %i15, %i16
  %i18 = and i32 %i17, 1
  ret i32 %i18
}

; Function Attrs: nofree nounwind
declare noundef i32 @fgetc(ptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: nofree nounwind uwtable
define dso_local void @bfwrite(i32 noundef %arg, ptr nocapture noundef %arg1) local_unnamed_addr #13 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 4
  %i2 = load i8, ptr %i, align 1, !tbaa !20
  %i3 = icmp eq i8 %i2, 8
  br i1 %i3, label %bb4, label %bb.bb10_crit_edge

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb4:                                              ; preds = %bb
  %i5 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %i6 = load i8, ptr %i5, align 2, !tbaa !22
  %i7 = sext i8 %i6 to i32
  %i8 = load ptr, ptr %arg1, align 8, !tbaa !17
  %i9 = tail call i32 @fputc(i32 noundef %i7, ptr noundef %i8)
  br label %bb10

bb10:                                             ; preds = %bb.bb10_crit_edge, %bb4
  %i11 = phi i8 [ 0, %bb4 ], [ %i2, %bb.bb10_crit_edge ]
  %i12 = add i8 %i11, 1
  store i8 %i12, ptr %i, align 1, !tbaa !20
  %i13 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %i14 = load i8, ptr %i13, align 2, !tbaa !22
  %i15 = shl i8 %i14, 1
  %i16 = trunc i32 %arg to i8
  %i17 = and i8 %i16, 1
  %i18 = or disjoint i8 %i15, %i17
  store i8 %i18, ptr %i13, align 2, !tbaa !22
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local void @bfclose(ptr nocapture noundef %arg) local_unnamed_addr #6 {
bb:
  %i = load ptr, ptr %arg, align 8, !tbaa !17
  %i1 = tail call i32 @fclose(ptr noundef %i)
  tail call void @free(ptr noundef %arg) #22
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: nofree norecurse nosync nounwind memory(write, inaccessiblemem: none) uwtable
define dso_local void @bitstring(ptr nocapture noundef writeonly %arg, i64 noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #14 {
bb:
  %i = ashr i32 %arg2, 2
  %i4 = and i32 %arg2, 3
  %i5 = icmp eq i32 %i4, 0
  %i6 = zext i1 %i5 to i32
  %i7 = add i32 %i, %arg2
  %i8 = sub i32 %arg3, %i7
  %i9 = add i32 %i8, %i6
  %i10 = icmp sgt i32 %i9, 0
  br i1 %i10, label %bb11, label %bb.bb18_crit_edge

bb.bb18_crit_edge:                                ; preds = %bb
  br label %bb18

bb11:                                             ; preds = %bb
  %i12 = add i32 %i6, %arg3
  %i13 = xor i32 %i7, -1
  %i14 = add i32 %i12, %i13
  %i15 = zext i32 %i14 to i64
  %i16 = add nuw nsw i64 %i15, 1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1) %arg, i8 32, i64 %i16, i1 false), !tbaa !8
  %i17 = getelementptr i8, ptr %arg, i64 %i16
  br label %bb18

bb18:                                             ; preds = %bb.bb18_crit_edge, %bb11
  %i19 = phi ptr [ %arg, %bb.bb18_crit_edge ], [ %i17, %bb11 ]
  %i20 = icmp sgt i32 %arg2, 0
  br i1 %i20, label %bb21, label %bb18.bb75_crit_edge

bb18.bb75_crit_edge:                              ; preds = %bb18
  br label %bb75

bb21:                                             ; preds = %bb18
  %i22 = zext nneg i32 %arg2 to i64
  %i23 = and i64 %i22, 1
  %i24 = icmp eq i64 %i23, 0
  br i1 %i24, label %bb21.bb38_crit_edge, label %bb25

bb21.bb38_crit_edge:                              ; preds = %bb21
  br label %bb38

bb25:                                             ; preds = %bb21
  %i26 = add nsw i64 %i22, -1
  %i27 = lshr i64 %arg1, %i26
  %i28 = trunc i64 %i27 to i8
  %i29 = and i8 %i28, 1
  %i30 = or disjoint i8 %i29, 48
  %i31 = getelementptr inbounds i8, ptr %i19, i64 1
  store i8 %i30, ptr %i19, align 1, !tbaa !8
  %i32 = and i64 %i26, 2
  %i33 = icmp eq i64 %i32, 0
  %i34 = icmp ne i64 %i26, 0
  %i35 = and i1 %i34, %i33
  br i1 %i35, label %bb36, label %bb25.bb38_crit_edge

bb25.bb38_crit_edge:                              ; preds = %bb25
  br label %bb38

bb36:                                             ; preds = %bb25
  %i37 = getelementptr inbounds i8, ptr %i19, i64 2
  store i8 32, ptr %i31, align 1, !tbaa !8
  br label %bb38

bb38:                                             ; preds = %bb25.bb38_crit_edge, %bb21.bb38_crit_edge, %bb36
  %i39 = phi i64 [ %i22, %bb21.bb38_crit_edge ], [ %i26, %bb36 ], [ %i26, %bb25.bb38_crit_edge ]
  %i40 = phi ptr [ %i19, %bb21.bb38_crit_edge ], [ %i37, %bb36 ], [ %i31, %bb25.bb38_crit_edge ]
  %i41 = phi ptr [ undef, %bb21.bb38_crit_edge ], [ %i37, %bb36 ], [ %i31, %bb25.bb38_crit_edge ]
  %i42 = icmp eq i32 %arg2, 1
  br i1 %i42, label %bb38.bb75_crit_edge, label %bb43.preheader

bb38.bb75_crit_edge:                              ; preds = %bb38
  br label %bb75

bb43.preheader:                                   ; preds = %bb38
  br label %bb43

bb43:                                             ; preds = %bb72.bb43_crit_edge, %bb43.preheader
  %i44 = phi i64 [ %i60, %bb72.bb43_crit_edge ], [ %i39, %bb43.preheader ]
  %i45 = phi ptr [ %i73, %bb72.bb43_crit_edge ], [ %i40, %bb43.preheader ]
  %i46 = add nsw i64 %i44, -1
  %i47 = lshr i64 %arg1, %i46
  %i48 = trunc i64 %i47 to i8
  %i49 = and i8 %i48, 1
  %i50 = or disjoint i8 %i49, 48
  %i51 = getelementptr inbounds i8, ptr %i45, i64 1
  store i8 %i50, ptr %i45, align 1, !tbaa !8
  %i52 = and i64 %i46, 3
  %i53 = icmp eq i64 %i52, 0
  %i54 = icmp ne i64 %i46, 0
  %i55 = and i1 %i54, %i53
  br i1 %i55, label %bb56, label %bb43.bb58_crit_edge

bb43.bb58_crit_edge:                              ; preds = %bb43
  br label %bb58

bb56:                                             ; preds = %bb43
  %i57 = getelementptr inbounds i8, ptr %i45, i64 2
  store i8 32, ptr %i51, align 1, !tbaa !8
  br label %bb58

bb58:                                             ; preds = %bb43.bb58_crit_edge, %bb56
  %i59 = phi ptr [ %i57, %bb56 ], [ %i51, %bb43.bb58_crit_edge ]
  %i60 = add nsw i64 %i44, -2
  %i61 = lshr i64 %arg1, %i60
  %i62 = trunc i64 %i61 to i8
  %i63 = and i8 %i62, 1
  %i64 = or disjoint i8 %i63, 48
  %i65 = getelementptr inbounds i8, ptr %i59, i64 1
  store i8 %i64, ptr %i59, align 1, !tbaa !8
  %i66 = and i64 %i60, 3
  %i67 = icmp eq i64 %i66, 0
  %i68 = icmp ne i64 %i60, 0
  %i69 = and i1 %i68, %i67
  br i1 %i69, label %bb70, label %bb58.bb72_crit_edge

bb58.bb72_crit_edge:                              ; preds = %bb58
  br label %bb72

bb70:                                             ; preds = %bb58
  %i71 = getelementptr inbounds i8, ptr %i59, i64 2
  store i8 32, ptr %i65, align 1, !tbaa !8
  br label %bb72

bb72:                                             ; preds = %bb58.bb72_crit_edge, %bb70
  %i73 = phi ptr [ %i71, %bb70 ], [ %i65, %bb58.bb72_crit_edge ]
  %i74 = icmp ugt i64 %i46, 1
  br i1 %i74, label %bb72.bb43_crit_edge, label %bb75.loopexit, !llvm.loop !23

bb72.bb43_crit_edge:                              ; preds = %bb72
  br label %bb43

bb75.loopexit:                                    ; preds = %bb72
  br label %bb75

bb75:                                             ; preds = %bb38.bb75_crit_edge, %bb18.bb75_crit_edge, %bb75.loopexit
  %i76 = phi ptr [ %i19, %bb18.bb75_crit_edge ], [ %i41, %bb38.bb75_crit_edge ], [ %i73, %bb75.loopexit ]
  store i8 0, ptr %i76, align 1, !tbaa !8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local i32 @bstr_i(ptr noundef readonly %arg) local_unnamed_addr #16 {
bb:
  %i = icmp eq ptr %arg, null
  br i1 %i, label %bb.bb22_crit_edge, label %bb1

bb.bb22_crit_edge:                                ; preds = %bb
  br label %bb22

bb1:                                              ; preds = %bb
  %i2 = load i8, ptr %arg, align 1, !tbaa !8
  %i3 = icmp eq i8 %i2, 0
  br i1 %i3, label %bb1.bb22_crit_edge, label %bb4.preheader

bb1.bb22_crit_edge:                               ; preds = %bb1
  br label %bb22

bb4.preheader:                                    ; preds = %bb1
  br label %bb4

bb4:                                              ; preds = %bb14.bb4_crit_edge, %bb4.preheader
  %i5 = phi i8 [ %i20, %bb14.bb4_crit_edge ], [ %i2, %bb4.preheader ]
  %i6 = phi ptr [ %i15, %bb14.bb4_crit_edge ], [ %arg, %bb4.preheader ]
  %i7 = phi i32 [ %i19, %bb14.bb4_crit_edge ], [ 0, %bb4.preheader ]
  %i8 = zext nneg i8 %i5 to i64
  %i9 = icmp ugt i8 %i5, 63
  %i10 = shl nuw i64 1, %i8
  %i11 = and i64 %i10, 844424930131969
  %i12 = icmp eq i64 %i11, 0
  %i13 = select i1 %i9, i1 true, i1 %i12
  br i1 %i13, label %bb4.bb22.loopexit_crit_edge, label %bb14

bb4.bb22.loopexit_crit_edge:                      ; preds = %bb4
  br label %bb22.loopexit

bb14:                                             ; preds = %bb4
  %i15 = getelementptr inbounds i8, ptr %i6, i64 1
  %i16 = shl i32 %i7, 1
  %i17 = and i8 %i5, 1
  %i18 = zext nneg i8 %i17 to i32
  %i19 = or disjoint i32 %i16, %i18
  %i20 = load i8, ptr %i15, align 1, !tbaa !8
  %i21 = icmp eq i8 %i20, 0
  br i1 %i21, label %bb22.loopexitsplit, label %bb14.bb4_crit_edge

bb14.bb4_crit_edge:                               ; preds = %bb14
  br label %bb4

bb22.loopexitsplit:                               ; preds = %bb14
  br label %bb22.loopexit

bb22.loopexit:                                    ; preds = %bb22.loopexitsplit, %bb4.bb22.loopexit_crit_edge
  %i23.ph = phi i32 [ %i7, %bb4.bb22.loopexit_crit_edge ], [ %i19, %bb22.loopexitsplit ]
  br label %bb22

bb22:                                             ; preds = %bb1.bb22_crit_edge, %bb.bb22_crit_edge, %bb22.loopexit
  %i23 = phi i32 [ 0, %bb.bb22_crit_edge ], [ 0, %bb1.bb22_crit_edge ], [ %i23.ph, %bb22.loopexit ]
  ret i32 %i23
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #6 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #22
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str.10, ptr noundef nonnull @.str.1.11)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2.12, i64 28, i64 1, ptr %i5) #20
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3.13, ptr noundef nonnull %i) #22
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !24
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb21_crit_edge

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i19, %bb12.bb12_crit_edge ], [ %i10, %bb12.preheader ]
  %i14 = phi i64 [ %i15, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  %i15 = add nuw nsw i64 %i14, 1
  %i16 = icmp eq i64 %i15, %i13
  %i17 = zext i1 %i16 to i32
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #22
  %i19 = load i64, ptr %i, align 8, !tbaa !24
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !26

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb7.bb21_crit_edge, %bb21.loopexit, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #22
  ret i32 %i22
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #17

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #18

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #17

attributes #0 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind }
attributes #8 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree norecurse nosync nounwind memory(write, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #16 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #18 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { nounwind allocsize(0,1) }
attributes #20 = { cold }
attributes #21 = { noreturn nounwind }
attributes #22 = { nounwind }
attributes #23 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !9, i64 0}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = !{!18, !14, i64 0}
!18 = !{!"", !14, i64 0, !9, i64 8, !9, i64 9, !9, i64 10, !9, i64 11}
!19 = !{!18, !9, i64 9}
!20 = !{!18, !9, i64 11}
!21 = !{!18, !9, i64 8}
!22 = !{!18, !9, i64 10}
!23 = distinct !{!23, !12}
!24 = !{!25, !25, i64 0}
!25 = !{!"long", !9, i64 0}
!26 = distinct !{!26, !12}
