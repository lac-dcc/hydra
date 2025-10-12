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

bb8:                                              ; preds = %bb8.loopexit, %bb.bb8_crit_edge
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

bb16:                                             ; preds = %bb16.loopexit, %bb.bb16_crit_edge
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

bb16:                                             ; preds = %bb16.loopexit, %bb.bb16_crit_edge
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
  br i1 %i10, label %bb11, label %bb15

bb11:                                             ; preds = %bb6
  %i12 = shl i64 %i9, 32
  %i13 = ashr exact i64 %i12, 32
  %i14 = icmp sgt i64 %i13, 0
  br i1 %i14, label %bb20.preheader, label %bb11.bb206_crit_edge

bb11.bb206_crit_edge:                             ; preds = %bb11
  br label %bb206

bb20.preheader:                                   ; preds = %bb11
  br label %bb20

bb15:                                             ; preds = %bb6
  %i16 = tail call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.8)
  %i17 = shl i64 %i9, 32
  %i18 = ashr exact i64 %i17, 32
  %i19 = icmp sgt i64 %i18, 0
  br i1 %i19, label %bb62.preheader, label %bb176

bb62.preheader:                                   ; preds = %bb15
  br label %bb62

bb20:                                             ; preds = %bb20.bb20_crit_edge, %bb20.preheader
  %i21 = phi i64 [ %i25, %bb20.bb20_crit_edge ], [ 1, %bb20.preheader ]
  %i22 = phi i64 [ %i24, %bb20.bb20_crit_edge ], [ 0, %bb20.preheader ]
  %i23 = tail call i32 @bit_count(i64 noundef %i21) #22
  %i24 = add nuw nsw i64 %i22, 1
  %i25 = add nuw nsw i64 %i21, 13
  %i26 = icmp eq i64 %i24, %i13
  br i1 %i26, label %bb27.preheader, label %bb20.bb20_crit_edge, !llvm.loop !15

bb20.bb20_crit_edge:                              ; preds = %bb20
  br label %bb20

bb27.preheader:                                   ; preds = %bb20
  br label %bb27

bb27:                                             ; preds = %bb27.bb27_crit_edge, %bb27.preheader
  %i28 = phi i64 [ %i32, %bb27.bb27_crit_edge ], [ 1, %bb27.preheader ]
  %i29 = phi i64 [ %i31, %bb27.bb27_crit_edge ], [ 0, %bb27.preheader ]
  %i30 = tail call i32 @bitcount(i64 noundef %i28) #22
  %i31 = add nuw nsw i64 %i29, 1
  %i32 = add nuw nsw i64 %i28, 13
  %i33 = icmp eq i64 %i31, %i13
  br i1 %i33, label %bb34.preheader, label %bb27.bb27_crit_edge, !llvm.loop !15

bb27.bb27_crit_edge:                              ; preds = %bb27
  br label %bb27

bb34.preheader:                                   ; preds = %bb27
  br label %bb34

bb34:                                             ; preds = %bb34.bb34_crit_edge, %bb34.preheader
  %i35 = phi i64 [ %i39, %bb34.bb34_crit_edge ], [ 1, %bb34.preheader ]
  %i36 = phi i64 [ %i38, %bb34.bb34_crit_edge ], [ 0, %bb34.preheader ]
  %i37 = tail call i32 @ntbl_bitcnt(i64 noundef %i35) #22
  %i38 = add nuw nsw i64 %i36, 1
  %i39 = add nuw nsw i64 %i35, 13
  %i40 = icmp eq i64 %i38, %i13
  br i1 %i40, label %bb41.preheader, label %bb34.bb34_crit_edge, !llvm.loop !15

bb34.bb34_crit_edge:                              ; preds = %bb34
  br label %bb34

bb41.preheader:                                   ; preds = %bb34
  br label %bb41

bb41:                                             ; preds = %bb41.bb41_crit_edge, %bb41.preheader
  %i42 = phi i64 [ %i46, %bb41.bb41_crit_edge ], [ 1, %bb41.preheader ]
  %i43 = phi i64 [ %i45, %bb41.bb41_crit_edge ], [ 0, %bb41.preheader ]
  %i44 = tail call i32 @ntbl_bitcount(i64 noundef %i42) #22
  %i45 = add nuw nsw i64 %i43, 1
  %i46 = add nuw nsw i64 %i42, 13
  %i47 = icmp eq i64 %i45, %i13
  br i1 %i47, label %bb48.preheader, label %bb41.bb41_crit_edge, !llvm.loop !15

bb41.bb41_crit_edge:                              ; preds = %bb41
  br label %bb41

bb48.preheader:                                   ; preds = %bb41
  br label %bb48

bb48:                                             ; preds = %bb48.bb48_crit_edge, %bb48.preheader
  %i49 = phi i64 [ %i53, %bb48.bb48_crit_edge ], [ 1, %bb48.preheader ]
  %i50 = phi i64 [ %i52, %bb48.bb48_crit_edge ], [ 0, %bb48.preheader ]
  %i51 = tail call i32 @BW_btbl_bitcount(i64 noundef %i49) #22
  %i52 = add nuw nsw i64 %i50, 1
  %i53 = add nuw nsw i64 %i49, 13
  %i54 = icmp eq i64 %i52, %i13
  br i1 %i54, label %bb55.preheader, label %bb48.bb48_crit_edge, !llvm.loop !15

bb48.bb48_crit_edge:                              ; preds = %bb48
  br label %bb48

bb55.preheader:                                   ; preds = %bb48
  br label %bb55

bb55:                                             ; preds = %bb55.bb55_crit_edge, %bb55.preheader
  %i56 = phi i64 [ %i60, %bb55.bb55_crit_edge ], [ 1, %bb55.preheader ]
  %i57 = phi i64 [ %i59, %bb55.bb55_crit_edge ], [ 0, %bb55.preheader ]
  %i58 = tail call i32 @AR_btbl_bitcount(i64 noundef %i56) #22
  %i59 = add nuw nsw i64 %i57, 1
  %i60 = add nuw nsw i64 %i56, 13
  %i61 = icmp eq i64 %i59, %i13
  br i1 %i61, label %bb206.loopexit, label %bb55.bb55_crit_edge, !llvm.loop !15

bb55.bb55_crit_edge:                              ; preds = %bb55
  br label %bb55

bb62:                                             ; preds = %bb62.bb62_crit_edge, %bb62.preheader
  %i63 = phi i64 [ %i70, %bb62.bb62_crit_edge ], [ 1, %bb62.preheader ]
  %i64 = phi i64 [ %i68, %bb62.bb62_crit_edge ], [ 0, %bb62.preheader ]
  %i65 = phi i64 [ %i69, %bb62.bb62_crit_edge ], [ 0, %bb62.preheader ]
  %i66 = tail call i32 @bit_count(i64 noundef %i63) #22
  %i67 = sext i32 %i66 to i64
  %i68 = add nsw i64 %i64, %i67
  %i69 = add nuw nsw i64 %i65, 1
  %i70 = add nuw nsw i64 %i63, 13
  %i71 = icmp eq i64 %i69, %i18
  br i1 %i71, label %bb72, label %bb62.bb62_crit_edge, !llvm.loop !15

bb62.bb62_crit_edge:                              ; preds = %bb62
  br label %bb62

bb72:                                             ; preds = %bb62
  %i73 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str, i64 noundef %i68)
  br label %bb74

bb74:                                             ; preds = %bb74.bb74_crit_edge, %bb72
  %i75 = phi i64 [ 1, %bb72 ], [ %i82, %bb74.bb74_crit_edge ]
  %i76 = phi i64 [ 0, %bb72 ], [ %i80, %bb74.bb74_crit_edge ]
  %i77 = phi i64 [ 0, %bb72 ], [ %i81, %bb74.bb74_crit_edge ]
  %i78 = tail call i32 @bitcount(i64 noundef %i75) #22
  %i79 = sext i32 %i78 to i64
  %i80 = add nsw i64 %i76, %i79
  %i81 = add nuw nsw i64 %i77, 1
  %i82 = add nuw nsw i64 %i75, 13
  %i83 = icmp eq i64 %i81, %i18
  br i1 %i83, label %bb84, label %bb74.bb74_crit_edge, !llvm.loop !15

bb74.bb74_crit_edge:                              ; preds = %bb74
  br label %bb74

bb84:                                             ; preds = %bb74
  %i85 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.1, i64 noundef %i80)
  br label %bb86

bb86:                                             ; preds = %bb86.bb86_crit_edge, %bb84
  %i87 = phi i64 [ 1, %bb84 ], [ %i94, %bb86.bb86_crit_edge ]
  %i88 = phi i64 [ 0, %bb84 ], [ %i92, %bb86.bb86_crit_edge ]
  %i89 = phi i64 [ 0, %bb84 ], [ %i93, %bb86.bb86_crit_edge ]
  %i90 = tail call i32 @ntbl_bitcnt(i64 noundef %i87) #22
  %i91 = sext i32 %i90 to i64
  %i92 = add nsw i64 %i88, %i91
  %i93 = add nuw nsw i64 %i89, 1
  %i94 = add nuw nsw i64 %i87, 13
  %i95 = icmp eq i64 %i93, %i18
  br i1 %i95, label %bb96, label %bb86.bb86_crit_edge, !llvm.loop !15

bb86.bb86_crit_edge:                              ; preds = %bb86
  br label %bb86

bb96:                                             ; preds = %bb86
  %i97 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.2, i64 noundef %i92)
  br label %bb98

bb98:                                             ; preds = %bb98.bb98_crit_edge, %bb96
  %i99 = phi i64 [ 1, %bb96 ], [ %i106, %bb98.bb98_crit_edge ]
  %i100 = phi i64 [ 0, %bb96 ], [ %i104, %bb98.bb98_crit_edge ]
  %i101 = phi i64 [ 0, %bb96 ], [ %i105, %bb98.bb98_crit_edge ]
  %i102 = tail call i32 @ntbl_bitcount(i64 noundef %i99) #22
  %i103 = sext i32 %i102 to i64
  %i104 = add nsw i64 %i100, %i103
  %i105 = add nuw nsw i64 %i101, 1
  %i106 = add nuw nsw i64 %i99, 13
  %i107 = icmp eq i64 %i105, %i18
  br i1 %i107, label %bb108, label %bb98.bb98_crit_edge, !llvm.loop !15

bb98.bb98_crit_edge:                              ; preds = %bb98
  br label %bb98

bb108:                                            ; preds = %bb98
  %i109 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.3, i64 noundef %i104)
  br label %bb110

bb110:                                            ; preds = %bb110.bb110_crit_edge, %bb108
  %i111 = phi i64 [ 1, %bb108 ], [ %i118, %bb110.bb110_crit_edge ]
  %i112 = phi i64 [ 0, %bb108 ], [ %i116, %bb110.bb110_crit_edge ]
  %i113 = phi i64 [ 0, %bb108 ], [ %i117, %bb110.bb110_crit_edge ]
  %i114 = tail call i32 @BW_btbl_bitcount(i64 noundef %i111) #22
  %i115 = sext i32 %i114 to i64
  %i116 = add nsw i64 %i112, %i115
  %i117 = add nuw nsw i64 %i113, 1
  %i118 = add nuw nsw i64 %i111, 13
  %i119 = icmp eq i64 %i117, %i18
  br i1 %i119, label %bb120, label %bb110.bb110_crit_edge, !llvm.loop !15

bb110.bb110_crit_edge:                            ; preds = %bb110
  br label %bb110

bb120:                                            ; preds = %bb110
  %i121 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.4, i64 noundef %i116)
  br label %bb122

bb122:                                            ; preds = %bb122.bb122_crit_edge, %bb120
  %i123 = phi i64 [ 1, %bb120 ], [ %i130, %bb122.bb122_crit_edge ]
  %i124 = phi i64 [ 0, %bb120 ], [ %i128, %bb122.bb122_crit_edge ]
  %i125 = phi i64 [ 0, %bb120 ], [ %i129, %bb122.bb122_crit_edge ]
  %i126 = tail call i32 @AR_btbl_bitcount(i64 noundef %i123) #22
  %i127 = sext i32 %i126 to i64
  %i128 = add nsw i64 %i124, %i127
  %i129 = add nuw nsw i64 %i125, 1
  %i130 = add nuw nsw i64 %i123, 13
  %i131 = icmp eq i64 %i129, %i18
  br i1 %i131, label %bb132, label %bb122.bb122_crit_edge, !llvm.loop !15

bb122.bb122_crit_edge:                            ; preds = %bb122
  br label %bb122

bb132:                                            ; preds = %bb122
  %i133 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.5, i64 noundef %i128)
  %i134 = and i64 %i9, 1
  %i135 = icmp eq i64 %i17, 4294967296
  br i1 %i135, label %bb132.bb183_crit_edge, label %bb136

bb132.bb183_crit_edge:                            ; preds = %bb132
  br label %bb183

bb136:                                            ; preds = %bb132
  %i137 = sub nsw i64 %i18, %i134
  br label %bb138

bb138:                                            ; preds = %bb170.bb138_crit_edge, %bb136
  %i139 = phi i64 [ 1, %bb136 ], [ %i173, %bb170.bb138_crit_edge ]
  %i140 = phi i64 [ 0, %bb136 ], [ %i172, %bb170.bb138_crit_edge ]
  %i141 = phi i64 [ 0, %bb136 ], [ %i174, %bb170.bb138_crit_edge ]
  br label %bb142

bb142:                                            ; preds = %bb142.bb142_crit_edge, %bb138
  %i143 = phi i32 [ %i148, %bb142.bb142_crit_edge ], [ 0, %bb138 ]
  %i144 = phi i32 [ %i149, %bb142.bb142_crit_edge ], [ 0, %bb138 ]
  %i145 = phi i64 [ %i150, %bb142.bb142_crit_edge ], [ %i139, %bb138 ]
  %i146 = trunc i64 %i145 to i32
  %i147 = and i32 %i146, 1
  %i148 = add nuw nsw i32 %i147, %i143
  %i149 = add nuw nsw i32 %i144, 1
  %i150 = lshr i64 %i145, 1
  %i151 = icmp ugt i64 %i145, 1
  %i152 = icmp ult i32 %i144, 63
  %i153 = select i1 %i151, i1 %i152, i1 false
  br i1 %i153, label %bb142.bb142_crit_edge, label %bb154, !llvm.loop !16

bb142.bb142_crit_edge:                            ; preds = %bb142
  br label %bb142

bb154:                                            ; preds = %bb142
  %i155 = zext nneg i32 %i148 to i64
  %i156 = add nuw nsw i64 %i140, %i155
  %i157 = add nuw nsw i64 %i139, 13
  br label %bb158

bb158:                                            ; preds = %bb158.bb158_crit_edge, %bb154
  %i159 = phi i32 [ %i164, %bb158.bb158_crit_edge ], [ 0, %bb154 ]
  %i160 = phi i32 [ %i165, %bb158.bb158_crit_edge ], [ 0, %bb154 ]
  %i161 = phi i64 [ %i166, %bb158.bb158_crit_edge ], [ %i157, %bb154 ]
  %i162 = trunc i64 %i161 to i32
  %i163 = and i32 %i162, 1
  %i164 = add nuw nsw i32 %i163, %i159
  %i165 = add nuw nsw i32 %i160, 1
  %i166 = lshr i64 %i161, 1
  %i167 = icmp ugt i64 %i161, 1
  %i168 = icmp ult i32 %i160, 63
  %i169 = select i1 %i167, i1 %i168, i1 false
  br i1 %i169, label %bb158.bb158_crit_edge, label %bb170, !llvm.loop !16

bb158.bb158_crit_edge:                            ; preds = %bb158
  br label %bb158

bb170:                                            ; preds = %bb158
  %i171 = zext nneg i32 %i164 to i64
  %i172 = add nuw nsw i64 %i156, %i171
  %i173 = add nuw nsw i64 %i139, 26
  %i174 = add i64 %i141, 2
  %i175 = icmp eq i64 %i174, %i137
  br i1 %i175, label %bb183.loopexit, label %bb170.bb138_crit_edge, !llvm.loop !15

bb170.bb138_crit_edge:                            ; preds = %bb170
  br label %bb138

bb176:                                            ; preds = %bb15
  %i177 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str, i64 noundef 0)
  %i178 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.1, i64 noundef 0)
  %i179 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.2, i64 noundef 0)
  %i180 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.3, i64 noundef 0)
  %i181 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.4, i64 noundef 0)
  %i182 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.5, i64 noundef 0)
  br label %bb203

bb183.loopexit:                                   ; preds = %bb170
  br label %bb183

bb183:                                            ; preds = %bb183.loopexit, %bb132.bb183_crit_edge
  %i184 = phi i64 [ undef, %bb132.bb183_crit_edge ], [ %i172, %bb183.loopexit ]
  %i185 = phi i64 [ 1, %bb132.bb183_crit_edge ], [ %i173, %bb183.loopexit ]
  %i186 = phi i64 [ 0, %bb132.bb183_crit_edge ], [ %i172, %bb183.loopexit ]
  %i187 = icmp eq i64 %i134, 0
  br i1 %i187, label %bb183.bb203_crit_edge, label %bb188.preheader

bb183.bb203_crit_edge:                            ; preds = %bb183
  br label %bb203

bb188.preheader:                                  ; preds = %bb183
  br label %bb188

bb188:                                            ; preds = %bb188.bb188_crit_edge, %bb188.preheader
  %i189 = phi i32 [ %i194, %bb188.bb188_crit_edge ], [ 0, %bb188.preheader ]
  %i190 = phi i32 [ %i195, %bb188.bb188_crit_edge ], [ 0, %bb188.preheader ]
  %i191 = phi i64 [ %i196, %bb188.bb188_crit_edge ], [ %i185, %bb188.preheader ]
  %i192 = trunc i64 %i191 to i32
  %i193 = and i32 %i192, 1
  %i194 = add nuw nsw i32 %i193, %i189
  %i195 = add nuw nsw i32 %i190, 1
  %i196 = lshr i64 %i191, 1
  %i197 = icmp ugt i64 %i191, 1
  %i198 = icmp ult i32 %i190, 63
  %i199 = select i1 %i197, i1 %i198, i1 false
  br i1 %i199, label %bb188.bb188_crit_edge, label %bb200, !llvm.loop !16

bb188.bb188_crit_edge:                            ; preds = %bb188
  br label %bb188

bb200:                                            ; preds = %bb188
  %i201 = zext nneg i32 %i194 to i64
  %i202 = add nuw nsw i64 %i186, %i201
  br label %bb203

bb203:                                            ; preds = %bb200, %bb183.bb203_crit_edge, %bb176
  %i204 = phi i64 [ 0, %bb176 ], [ %i184, %bb183.bb203_crit_edge ], [ %i202, %bb200 ]
  %i205 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef nonnull @.str.6, i64 noundef %i204)
  br label %bb206

bb206.loopexit:                                   ; preds = %bb55
  br label %bb206

bb206:                                            ; preds = %bb206.loopexit, %bb203, %bb11.bb206_crit_edge
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

bb10:                                             ; preds = %bb7, %bb6, %bb.bb10_crit_edge
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

bb10:                                             ; preds = %bb4, %bb.bb10_crit_edge
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

bb18:                                             ; preds = %bb11, %bb.bb18_crit_edge
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

bb38:                                             ; preds = %bb36, %bb25.bb38_crit_edge, %bb21.bb38_crit_edge
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

bb58:                                             ; preds = %bb56, %bb43.bb58_crit_edge
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

bb72:                                             ; preds = %bb70, %bb58.bb72_crit_edge
  %i73 = phi ptr [ %i71, %bb70 ], [ %i65, %bb58.bb72_crit_edge ]
  %i74 = icmp ugt i64 %i46, 1
  br i1 %i74, label %bb72.bb43_crit_edge, label %bb75.loopexit, !llvm.loop !23

bb72.bb43_crit_edge:                              ; preds = %bb72
  br label %bb43

bb75.loopexit:                                    ; preds = %bb72
  br label %bb75

bb75:                                             ; preds = %bb75.loopexit, %bb38.bb75_crit_edge, %bb18.bb75_crit_edge
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

bb22:                                             ; preds = %bb22.loopexit, %bb1.bb22_crit_edge, %bb.bb22_crit_edge
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

bb21:                                             ; preds = %bb21.loopexit, %bb7.bb21_crit_edge, %bb4
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
