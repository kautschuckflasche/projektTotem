﻿using UnityEngine;
using System.Collections;

public class Punch : AttackScript
{
    public float Damage = 5;

    public override void UseAttack(Transform attackingPlayerTransform)
    {
        //Todo epic shit from here..
        Debug.Log("Punch");

        Vector3 playerPos = attackingPlayerTransform.position;
        Vector3 playerDir = attackingPlayerTransform.forward;

        var opfer = Physics2D.Raycast(playerPos + playerDir, playerDir, 1.5f);
        if (opfer)
        {
            opfer.rigidbody.AddForce(playerDir * 750);
        }
    }
}
